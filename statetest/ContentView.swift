//
//  ContentView.swift
//  statetest
//
//  Created by Hans Cathcart on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "bird")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("This is a test of state!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
