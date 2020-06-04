//
//  InsectCellView.swift
//  Cross-Platform-MacOS
//
//  Created by Edgar Nzokwe on 5/31/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct InsectCellView: View {
    @State var insect:Insect
    var body: some View {
        HStack{
            Image(insect.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Rectangle())
                .frame(width:60, height: 60)
            
            VStack(alignment: .leading){
                Text(insect.name).font(.system(size: 25))
                Text(insect.habitat)
            }
        }.padding(.vertical, 3)
    }
}

struct InsectCellView_Previews: PreviewProvider {
    static var previews: some View {
        InsectCellView(insect: testInsect)
    }
}
