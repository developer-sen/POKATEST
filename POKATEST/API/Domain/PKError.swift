//
//  PKError.swift
//  POKATEST
//
//  Created by Sanju-Maduwantha on 2023-12-21.
//

import Foundation
import Alamofire

struct PKError: Error, Identifiable {
    let initialError: AFError?
    let backendError: BackendError?
    let id = UUID()
}

struct BackendError: Codable, Error {
    var message: String
}
