import Foundation
import Combine

protocol RandomViewModelObject: ObservableObject {
    func onAppar()
    func getItem()
    var items: [ItemsResponse] { get set }
    var errorCode: String { get set }
    var showAlert: Bool { get set }
    var showIndicator: Bool { get set }
}

final class RandomViewModel: RandomViewModelObject {
    @Published var items: [ItemsResponse] = []
    @Published var errorCode: String = ""
    @Published var showAlert: Bool = false
    @Published var showIndicator: Bool = true
    
    private var task: AnyCancellable? = nil
    
    func onAppar() {
        getItem()
    }
    
    func getItem() {
        let page = Int.random(in: 1...100)
        let num = Int.random(in: 0...99)
        self.task = NetworkPublisher.publish(RandomRequest(page: page))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {[weak self] completion in
                switch completion {
                case .finished:
                    print("success")
                    self?.showIndicator = false
                case let .failure(error):
                    print(error)
                    self?.errorCode = error.localizedDescription
                    self?.showAlert = true
                }
            }, receiveValue: { [weak self] data in
                self?.items.append(data[num])
                self?.errorCode = ""
                self?.showAlert = false
            })
    }
    
    func restart() {
        showIndicator = true
        items.removeAll()
        errorCode = ""
        showAlert = false
        getItem()
    }
}
