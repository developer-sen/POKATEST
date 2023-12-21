//
//  FactoryDetailView.swift
//  POKATEST
//
//  Created by Sanju-Maduwantha on 2023-12-21.
//

import SwiftUI

struct FactoryDetailView: View {
    @State var factory: Factory
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("IDLabel")
                    .fontWeight(.bold)
                Spacer()
                Text("\(factory.id)")
            }
            HStack {
                Text("AddressLabel")
                    .fontWeight(.bold)
                Spacer()
                Text(factory.address)
            }
            HStack {
                Text("DivisionLabel")
                    .fontWeight(.bold)
                Spacer()
                Text(factory.division)
            }
            HStack {
                Text("CountryLabel")
                    .fontWeight(.bold)
                Spacer()
                Text(factory.country)
            }
            Spacer()
        }
        .padding()
        .navigationTitle(factory.name)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        FactoryDetailView(
            factory: Factory(address: "3080 Justin Manors Apt. 363", country: "TH", division: "Tires", id: 20, name: "Lewis-Cross"))
    }
}
