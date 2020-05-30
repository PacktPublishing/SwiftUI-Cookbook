//
//  DetailView.swift
//  CrossPlatformStarter
//
//  Created by Edgar Nzokwe on 5/29/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct DetailView: View {
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
            
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(insect: testInsect)
    }
}
