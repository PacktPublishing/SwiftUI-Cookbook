//
//  ArticleView.swift
//  DynamicTypeSizesPreview
//
//  Created by Edgar Nzokwe on 4/8/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ArticleView: View {
    var article: Article 
    var body: some View {
        HStack{
            Image(article.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:150, height:100)
            .clipShape(Ellipse())
            VStack {
                Text(article.title)
                    .font(.title)
                Text(article.description)
                .padding()
            }
                
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: sampleArticle1)
    }
}
