//
//  ContentView.swift
//  statetest
//
//  Created by Hans Cathcart on 5/20/23.
//

import SwiftUI

class Pet: ObservableObject {
    @Published var name: String
    @Published var age: Int
    
    static let Example: Pet = Pet(name: "Example Name", age: 1)
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

struct ContentView: View {
    @State private var name: String = "Joe"
    @State private var isOn: Bool = true
    
    @ObservedObject var murphy: Pet = Pet(name: "Murphy", age: 12)
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "bird")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("This is a test of state!")
                Text(name)
                Text("\(Pet.Example.name) is a \(Pet.Example.age)")
                Text("\(murphy.name) is \(murphy.age)")
                
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
                        TextField("Pet Name", text: $murphy.name)

                        TextField("Pet Age", value: $murphy.age, format: .number)
                    }
                    Section {
                        List {
                            NavigationLink("Page with its own @State") {
                                NextView()
                            }
                            NavigationLink("Page with a binding to this @State") {
                                AnotherView(name: $name, isOn: $isOn)
                            }
                            NavigationLink("Page watching @ObservedObject") {
                                ObservingView(cat: murphy)
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
