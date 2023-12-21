//
//  AlertViews.swift
//  POKATEST
//
//  Created by Sanju-Maduwantha on 2023-12-21.
//

import SwiftUI

struct AlertViews {
    static func defaultErrorAlert(error: PKError, onTap: @escaping () -> () = {}) -> Alert {
        if let error = error.initialError?.underlyingError as? NSError {
            if error.code == -1009 || error.localizedDescription.contains("offline"){
                return Alert(
                    title: Text("AlertTitle.Error"),
                    message: Text("InternetError"),
                    dismissButton: .default(Text("AlertAction.OK"), action: onTap))
            } else if error.code == -1003 || error.localizedDescription.contains("specified hostname") {
                return Alert(
                    title: Text("AlertTitle.Error"),
                    message: Text("HostError"),
                    dismissButton: .default(Text("AlertAction.OK"), action: onTap))
            } else {
                print("PKError: \(error.code) \(error.localizedDescription)")
            }
        }
        return Alert(
            title: Text("AlertTitle.Error"),
            message: Text("OtherError"),
            dismissButton: .default(Text("AlertAction.OK"), action: onTap))
    }
}
