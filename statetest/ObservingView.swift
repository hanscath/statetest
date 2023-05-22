//
//  ObservingView.swift
//  statetest
//
//  Created by Hans Cathcart on 5/21/23.
//

import SwiftUI

struct ObservingView: View {
    @ObservedObject var cat: Pet
    
    var body: some View {
        Text("\(cat.name) is \(cat.age)")
    }
}

struct ObservingView_Previews: PreviewProvider {
    static var previews: some View {
        ObservingView(cat: Pet(name: "a cat", age: 1))
    }
}
