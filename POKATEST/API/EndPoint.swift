//
//  EndPoint.swift
//  POKATEST
//
//  Created by Sanju-Maduwantha on 2023-12-21.
//

import Foundation

enum EndPoint {
    case getFactories
    var path: String {
        switch self {
        case .getFactories:
            return "dev%@"
        }
    }
}
