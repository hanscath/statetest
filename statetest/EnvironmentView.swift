//
//  EnvironmentView.swift
//  statetest
//
//  Created by Hans Cathcart on 5/21/23.
//

import SwiftUI

struct EnvironmentView: View {
    @EnvironmentObject var airplane: Airplane
    @EnvironmentObject var airplane2: Airplane2

    var body: some View {
        NavigationStack {
            Text(airplane.name)
            NavigationLink("Page watching @EnvironmentObject") {
                EnvironmentNextView()
            }
            Text(airplane2.name)
        }
    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView()
            .environmentObject(Airplane("Test"))
            .environmentObject(Airplane2("Test2"))
    }
}
