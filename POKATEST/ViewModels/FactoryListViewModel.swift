//
//  FactoryListViewModel.swift
//  POKATEST
//
//  Created by Sanju-Maduwantha on 2023-12-21.
//

import Foundation

import SwiftUI
import Combine

@MainActor class FactoryListViewModel: ObservableObject {
    private var cancellableSet: Set<AnyCancellable> = []
    @Published var processInProgress = false
    @Published var error: PKError?
    @Published var factoryList: [Factory] = []
    @Published var next: String = ""
    @Published var nextPageNo: Int = 0
    @Published var lastPageRetrieved = false
    var factoryAPI = FactoryAPI()
    
    func refreshFactoryList() {
        self.next = ""
        self.lastPageRetrieved = false
        self.getFactoryList()
    }
    
    func getFactoryList() {
        self.processInProgress = true
       factoryAPI.getFactories(offset: next)
            .sink { response in
                self.processInProgress = false
                if let error = response.error {
                    self.error = error
                } else {
                    if let res = response.value {
                        if self.next.isEmpty {
                            self.factoryList = res.results
                        } else {
                            self.factoryList.append(contentsOf: res.results)
                        }
                        if let next = res.next {
                            self.next = next
                        } else {
                            self.lastPageRetrieved = true
                        }
                    }
                }
            }.store(in: &cancellableSet)
    }
}

