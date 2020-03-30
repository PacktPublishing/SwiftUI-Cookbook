//
//  ContentView.swift
//  DynamicTypeSizesPreview
//
//  Created by Edgar Nzokwe on 3/29/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var articleCell: ArticleCell  = ArticleCell(imageName: "", title: "", description: "")
    var body: some View {
        HStack{
            Image(articleCell.imageName)
            .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:150, height:100)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            VStack {
                Text(articleCell.title)
                    .font(.title)
                Text(articleCell.description)
                .padding()
            }
                
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ContentView(articleCell: sampleCell)
            ContentView(articleCell: sampleCell)
                .environment(\.sizeCategory, .extraSmall)
            ContentView(articleCell: sampleCell)
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }.previewLayout(.sizeThatFits)
    }
}
