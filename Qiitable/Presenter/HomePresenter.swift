import Foundation
import Combine

protocol HomePresenter {
    func onAppar()
    func getItems()
}

class HomePresenterImpl: HomePresenter, ObservableObject {
    
    @Published var items: [ItemsResponse] = []
    @Published var errorCode: String = ""
    @Published var showAlert: Bool = false
    @Published var showIndicator: Bool = true
    
    var task: AnyCancellable? = nil
    
    func onAppar() {
        getItems()
    }
    
    func getItems() {
        task = NetworkPublisher.publish(ItemsRequest())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
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
                self?.items = data
                self?.errorCode = ""
                self?.showAlert = false
            })
    }
    
    
}
