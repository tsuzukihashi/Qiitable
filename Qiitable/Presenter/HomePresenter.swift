import Foundation

protocol HomePresenter: ObservableObject {
    var items: [Item] { get set }
    func onAppear()
}

final class HomePresenterImpl: HomePresenter {
    private let router: HomeRouter
    private let useCase: HomeUseCase
    @Published var items: [Item] = []

    private var isLoading = false
    private let perPage = 20
    private var offset = 1

    init(router: HomeRouter, useCase: HomeUseCase) {
        self.router = router
        self.useCase = useCase
    }

    func onAppear() {
        useCase.fetch { [weak self] result in
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
