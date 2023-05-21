//
//  NextView.swift
//  statetest
//
//  Created by Hans Cathcart on 5/20/23.
//

import SwiftUI

struct NextView: View {
    @State private var name: String = "not Joe"
    
    var body: some View {
        Text("\(name)")
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView()
    }
}
