//
//  GetFactoriesResponse.swift
//  POKATEST
//
//  Created by Sanju-Maduwantha on 2023-12-21.
//

import Foundation
struct GetFactoriesResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Factory]
}
