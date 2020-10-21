//
//  ContentView.swift
//  AngelaCard
//
//  Created by Zhenyuan Bo on 2020-10-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(.green)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Text("Hello, World!")        .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
