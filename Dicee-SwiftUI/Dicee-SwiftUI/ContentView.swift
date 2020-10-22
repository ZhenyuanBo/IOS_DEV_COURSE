//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Zhenyuan Bo on 2020-10-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                HStack {
                    DiceView(n: 1)
                    DiceView(n: 1)
                }
                .padding(.horizontal)
            }
        }

    }
}

struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

