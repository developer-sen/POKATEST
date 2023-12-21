//
//  FactoryAPI.swift
//  POKATEST
//
//  Created by Sanju-Maduwantha on 2023-12-21.
//

import Foundation
import Combine
import Alamofire

protocol FactoryAPIProtocol {
    func getFactories(offset: String) -> AnyPublisher<DataResponse<GetFactoriesResponse, PKError>, Never>
}

class FactoryAPI: FactoryAPIProtocol {
    private var cancellableSet: Set<AnyCancellable> = []
    func getFactories(offset: String) -> AnyPublisher<Alamofire.DataResponse<GetFactoriesResponse, PKError>, Never> {
        return APIClient.shared.request(route: .getFactories,
                                        pathComponents: offset,
                                        params: nil as String?,
                                        headerKeys: [], // Add Endpoint specific Headers if needed
                                        httpMethod: .get)
    }
}
