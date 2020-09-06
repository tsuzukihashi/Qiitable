import Foundation

protocol SearchListPresenter: ObservableObject {
    var searchText: String { get set }
    var items: [Item] { get set }
    func onAppear()
}

final class SesarchListPresenterImpl: SearchListPresenter {
    @Published var searchText: String
    private let useCase: SearchListUseCase
    @Published var items: [Item] = []

    init(searchText: String, useCase: SearchListUseCase) {
        self.searchText = searchText
        self.useCase = useCase
    }

    func onAppear() {
        useCase.fetch(query: searchText, page: 1) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let items):
                self.items = items
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
