//
//  ContentView.swift
//  statetest
//
//  Created by Hans Cathcart on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = "Joe"
    @State private var isOn: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "bird")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("This is a test of state!")
                Text(name)
                
                Form {
                    Section {
                        TextField("Name", text: $name)
                    } header: {
                        Text("Enter your name")
                    }
                    Toggle(isOn: $isOn) {
                        Text("Advanced")
                    }
                    Section {
                        List {
                            NavigationLink("Next Page with its own @State") {
                                NextView()
                            }
                            NavigationLink("Next Page with a binding to this @State") {
                                AnotherView(name: $name, isOn: $isOn)
                            }
                        }
                    } header: {
                        Text("Options")
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
