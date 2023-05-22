//
//  EnvironmentNextView.swift
//  statetest
//
//  Created by Hans Cathcart on 5/21/23.
//

import SwiftUI

struct EnvironmentNextView: View {
    @EnvironmentObject var airplane: Airplane

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $airplane.name)
            } header: {
                Text(airplane.name)
            }
        }
    }
}

struct EnvironmentNextView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentNextView()
            .environmentObject(Airplane())
    }
}
