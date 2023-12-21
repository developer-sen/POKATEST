//
//  Util.swift
//  POKATEST
//
//  Created by Sanju-Maduwantha on 2023-12-21.
//

import Foundation


class Util {
    static func infoForKey(_ key: String) -> String {
        guard let value = Bundle.main.infoDictionary?[key] as? String else {
            return ""
        }
        return value
    }
}
