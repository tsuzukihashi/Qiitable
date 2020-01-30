import Foundation
import Combine

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
        self.task = NetworkPublisher.publish(ItemsRequest())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.showIndicator = false
                switch completion {
                case .finished:
                    print("success")
                case let .failure(error):
                    print(error)
                    self.errorCode = error.localizedDescription
                    self.showAlert = true
                }
            }, receiveValue: { data in
                self.items = data
                self.errorCode = ""
                self.showAlert = false
            })
    }
    
    
}
