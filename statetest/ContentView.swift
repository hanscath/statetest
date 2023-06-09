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
    @Published var city: String
    
    private var newInCity: Bool {
        get {
            if self.city == "" {
                return false
            } else {
                return true
            }
        }
    }

    static let Example: Pet = Pet(name: "Example Name", age: 1, city: "")
    
    init(name: String, age: Int, city: String?) {
        self.name = name
        self.age = age
        self.city = city ?? ""
    }
    
    func printCityStatus() -> String {
        return (self.newInCity ? "in City" : "not in City")
    }
}

class Automobile: ObservableObject {
    @Published var name: String
    @Published var age: Int
    
    static let Example: Automobile = Automobile(name: "Example Auto", age: 1)

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Airplane: ObservableObject {
    @Published var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

class Airplane2: ObservableObject {
    @Published var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

struct ExtraView: View {
    @EnvironmentObject var airplane: Airplane
    
    var body: some View {
        Text(airplane.name)
    }
}

struct ContentView: View {
    @State private var name: String = "Joe"
    @State private var isOn: Bool = true
    @State private var birthDate = Date()

//    Should I be using a StateObject here?
    @ObservedObject var murphy: Pet = Pet(name: "Murphy", age: 12, city: "Windsor")
    
    @StateObject var auto: Automobile = Automobile(name: "Ford", age: 4)
    
//    Will be based into the Environment
    @StateObject var airplane: Airplane = Airplane("Concorde")
    @StateObject var airplane2: Airplane2 = Airplane2("747")
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    Text(name)
                    Text("\(Pet.Example.name) is a \(Pet.Example.age) \(Pet.Example.printCityStatus())")
                    Text("\(self.murphy.name) is \(self.murphy.age) \(self.murphy.printCityStatus())")
                    Text("Birth date is \(birthDate, formatter: dateFormatter)")
                    Text("Auto \(auto.name)")
                    Text("Aircraft \(airplane.name)")
                }
                .padding(.leading)
                .border(Color(red: 0.95, green: 0.95, blue: 0.95))
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(red: 0.9, green: 0.9, blue: 0.9))
            }
            VStack {
                Form {
                    Section {
                        TextField("Name", text: $name)
                        Toggle(isOn: $isOn) {
                            Text("Advanced")
                        }
                    } header: {
                        Text("Enter your name")
                    }
                    Section {
                        TextField("Pet Name", text: $murphy.name)

                        TextField("Pet Age", value: $murphy.age, format: .number)
                        
                        TextField("Pet City", text: $murphy.city)
                    }
                    
                    ExtraView()
                    
                    Section {
                        DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                            Text("Select a Date")
                        }
                    }
//                    .labelsHidden()

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
                            NavigationLink("Page watching @StateObject") {
                                StateView(auto: auto)
                            }
                            NavigationLink("Page watching @EnvironmentObject") {
                                EnvironmentView()
                            }
                        }
                    } header: {
                        Text("Options")
                    }
                }
            }
//            This ends up hiding the actual Title, but retaining the text for the back button on subsequent pages.
            .navigationBarTitle(Text("Test of State"), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "bird")
                        Text("Test of State")
                    }
                    .bold()
                }
            }
        }
        .environmentObject(airplane)
        .environmentObject(airplane2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
