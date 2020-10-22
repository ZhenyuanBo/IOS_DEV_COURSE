//
//  InfoView.swift
//  AngelaCard
//
//  Created by Zhenyuan Bo on 2020-10-21.
//

import SwiftUI


struct InfoView: View {
    let text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(
                Text(text)
            )
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello").previewLayout(.sizeThatFits)
    }
}
