//
//  StateView.swift
//  statetest
//
//  Created by Hans Cathcart on 5/21/23.
//

import SwiftUI

struct StateView: View {
    @ObservedObject var auto: Automobile
    
    var body: some View {
        NavigationStack {
            Form {
                Text("\(auto.name) is \(auto.age)")
                TextField("Auto Name", text: $auto.name)
            }
        }
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView(auto: Automobile(name: "example auto", age: 1))
    }
}
