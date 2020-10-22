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
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("bo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Zhenyuan Bo")
                    .font(Font.custom("Commissioner-VariableFont_wght", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("Sr.Associate Engineer, Product Software")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .frame(height: 50)
                    .overlay(Text("+1 416-998-4954"))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
