//
//  ContentView.swift
//  POKATEST
//
//  Created by Sanju-Maduwantha on 2023-12-21.
//

import SwiftUI

struct FactoryListView: View {
    @StateObject var viewModel = FactoryListViewModel()
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 5, content: {
                    ForEach(viewModel.factoryList, id: \.id) { factory in
                        NavigationLink {
                            FactoryDetailView(factory: factory)
                        } label: {
                            HStack(alignment: .center, spacing: 0, content: {
                                Image(systemName: "building.columns")
                                    .resizable()
                                    .foregroundColor(.blue)
                                    .frame(width: 40, height: 40)
                                    .padding(20)
                                VStack(alignment: .leading, spacing: 5, content: {
                                    Text(factory.name)
                                        .fontWeight(.bold)
                                    Text(factory.division)
                                })
                                .accessibilityIdentifier("FactoryNameLabel")
                                .padding(.vertical, 20)
                                Spacer()
                            })
                        }
                        .buttonStyle(.plain)
                        .accessibilityIdentifier("NavigateToDetailView")
                    }
                    if !viewModel.lastPageRetrieved && !viewModel.next.isEmpty {
                        HStack(alignment: .center) {
                            Spacer()
                            ProgressView()
                                .onAppear {
                                    viewModel.getFactoryList()
                                }
                            Spacer()
                        }
                    }
                })
            }
            .onAppear(perform: {
                viewModel.refreshFactoryList()
            })
            if viewModel.processInProgress {
                ProgressView()
            }
        }
        .alert(item: $viewModel.error, content: { error in
            AlertViews.defaultErrorAlert(error: error)
        })
        .navigationTitle(Text("FactoryListTitle"))
    }
}

#Preview {
    NavigationStack {
        FactoryListView()
    }
}
