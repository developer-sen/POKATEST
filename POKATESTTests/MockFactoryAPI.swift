//
//  MockFactoryAPI.swift
//  POKATESTTests
//
//  Created by Sanju-Maduwantha on 2023-12-21.
//

@testable import POKATEST
import Combine

class MockFactoryAPI: FactoryAPI {

    var stubbedResponse: GetFactoriesResponse?

    func getFactories(offset: String?) -> AnyPublisher<GetFactoriesResponse, PKError> {
        return Future<GetFactoriesResponse, PKError> { promise in
            if let stubbedResponse = self.stubbedResponse {
                promise(.success(stubbedResponse))
            } else {
                promise(.failure(PKError(initialError: nil, backendError: BackendError(message: "Forbidden"))))
            }
        }.eraseToAnyPublisher()
    }
}
