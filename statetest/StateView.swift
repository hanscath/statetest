//
//  StateView.swift
//  statetest
//
//  Created by Hans Cathcart on 5/21/23.
//

import SwiftUI

struct StateView: View {
    @Binding var auto: Automobile
    
    var body: some View {
        Text("\(auto.name) is \(auto.age)")
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView(auto: .constant(Automobile(name: "example auto", age: 1)))
    }
}
