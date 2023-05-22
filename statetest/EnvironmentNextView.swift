//
//  EnvironmentNextView.swift
//  statetest
//
//  Created by Hans Cathcart on 5/21/23.
//

import SwiftUI

struct EnvironmentNextView: View {
    @EnvironmentObject var airplane: Airplane
    @EnvironmentObject var airplane2: Airplane2

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $airplane.name)
            } header: {
                Text(airplane.name)
            }
            Section {
                TextField("Name", text: $airplane2.name)
            } header: {
                Text(airplane2.name)
            }
        }
    }
}

struct EnvironmentNextView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentNextView()
            .environmentObject(Airplane("Test 1"))
            .environmentObject(Airplane2("Test 2"))
    }
}
