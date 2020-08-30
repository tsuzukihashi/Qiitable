import Foundation
import Combine

/// @mockable
protocol HomeUseCase {
    func fetch(completion: @escaping (Swift.Result<[Item], Error>) -> Void)
}

final class HomeUseCaseImpl: HomeUseCase {
    let repository: ItemRepository
    var cancellables: Set<AnyCancellable> = []

    init(repository: ItemRepository) {
        self.repository = repository
    }

    deinit {
        cancellables.forEach { $0.cancel() }
    }

    func fetch(completion: @escaping (Swift.Result<[Item], Error>) -> Void) {
        return repository
            .fetch()
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    completion(.failure(error))
                }
            }, receiveValue: { items in
                completion(.success(items))
            }).store(in: &cancellables)
    }
}
