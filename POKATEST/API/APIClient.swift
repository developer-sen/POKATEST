//
//  APIClient.swift
//  POKATEST
//
//  Created by Sanju-Maduwantha on 2023-12-21.
//

import Foundation
import Combine
import Alamofire

class APIClient: NSObject, URLSessionDelegate {
    let client: Alamofire.Session = {
        let manager = ServerTrustManager(evaluators: ["sg666zbdmf.execute-api.us-east-1.amazonaws.com": DisabledTrustEvaluator()])
        let configuration = URLSessionConfiguration.af.default
        return Session(configuration: configuration, serverTrustManager: manager)
    }()
    static let shared = APIClient()
    private func getBaseURL() -> String {
        return Util.infoForKey("BASE_URL")
    }
    func request<T: Decodable, U: Encodable>(route: EndPoint,
                 pathComponents: String...,
                 params: U?,
                 headerKeys: [HTTPHeaderKey],
                 httpMethod: HTTPMethod) -> AnyPublisher<DataResponse<T, PKError>, Never> {
        let baseURL = getBaseURL()
        let url = String(format: baseURL + route.path, arguments: pathComponents)
        let headers = self.headerFactory(with: headerKeys)
        return client.request(url, method: httpMethod, parameters: params, encoder: JSONParameterEncoder.default, headers: headers)
            .validate()
            .publishDecodable(type: T.self)
            .map { response in
                response.mapError { error in
                    print(error)
                    return self.handleErrorResponse(responseData: response.data, error: error)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func handleErrorResponse(responseData: Data?, error: AFError) -> PKError {
        if let backendError = responseData.flatMap({ try? JSONDecoder().decode(BackendError.self, from: $0)}) {
            return PKError(initialError: error, backendError: backendError)
        } else {
            return PKError(initialError: error, backendError: nil)
        }
    }

    func headerFactory(with headerKeys: [HTTPHeaderKey]) -> HTTPHeaders {
        var headers: [String: String] = [:]
        for headerKey in headerKeys {
            switch headerKey {
            case .Accept:
                headers[HTTPHeaderKey.Accept.rawValue] = "*/*"
            case .ContentType:
                headers[HTTPHeaderKey.ContentType.rawValue] = "application/json"
            }
        }
        // Add common http headers here
        return HTTPHeaders(headers)
    }
}

