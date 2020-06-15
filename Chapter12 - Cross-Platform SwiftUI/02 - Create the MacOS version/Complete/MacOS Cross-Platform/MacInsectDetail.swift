//
//  MacInsectDetail.swift
//  MacOS Cross-Platform
//
//  Created by Edgar Nzokwe on 6/8/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct MacInsectDetail: View {
    var insect:Insect
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

struct MacInsectDetail_Previews: PreviewProvider {
    static var previews: some View {
        MacInsectDetail(insect: testInsect)
    }
}
