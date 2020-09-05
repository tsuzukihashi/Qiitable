import Foundation

/// @mockable
protocol HomeUseCase {
    func fetch(completion: @escaping (Swift.Result<[Item], Error>) -> Void)
}

final class HomeUseCaseImpl: HomeUseCase {
    let repository: ItemRepository

    init(repository: ItemRepository) {
        self.repository = repository
    }

    func fetch(completion: @escaping (Swift.Result<[Item], Error>) -> Void) {
        repository.fetch(completion: completion)
    }
}
