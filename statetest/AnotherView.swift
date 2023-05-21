//
//  AnotherView.swift
//  statetest
//
//  Created by Hans Cathcart on 5/20/23.
//

import SwiftUI

struct AnotherView: View {
    @Binding var name: String
    @Binding var isOn: Bool
    
    var body: some View {
        Form {
            Section {
                Text("\(name)")
            } header: {
                Text("Name")
            }
            
            Toggle(isOn: (isOn ? .constant(true) : .constant(false))) {
                Text("Advanced")
            }
        }
    }
}

struct AnotherView_Previews: PreviewProvider {
    static var previews: some View {
        AnotherView(name: .constant("Test"), isOn: .constant(true))
    }
}
