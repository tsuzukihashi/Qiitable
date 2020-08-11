import Foundation
import Combine

protocol RandomPresenter {
    func onAppar()
    func getItem()
}

class RandomPresenterImpl: RandomPresenter, ObservableObject {
    
    @Published var items: [ItemsResponse] = []
    @Published var errorCode: String = ""
    @Published var showAlert: Bool = false
    @Published var showIndicator: Bool = true
    
    var task: AnyCancellable? = nil
    
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
