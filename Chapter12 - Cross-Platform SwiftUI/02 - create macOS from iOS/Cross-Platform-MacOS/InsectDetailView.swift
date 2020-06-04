//
//  InsectDetailView.swift
//  Cross-Platform-MacOS
//
//  Created by Edgar Nzokwe on 5/31/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI
struct InsectDetailView: View {
    @State var insect:Insect
    var body: some View {
        VStack{
            Text(insect.name)
                .font(.largeTitle)
            Image(insect.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Habitat")
                .font(.title)
            Text(insect.habitat)
            Text("Description")
                .font(.title)
                .padding()
            Text(insect.description)
            
            
        }.frame(maxWidth: 700)
    }
}

struct InsectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InsectDetailView(insect: testInsect)
    }
}
