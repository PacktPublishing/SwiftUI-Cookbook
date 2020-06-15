//
//  WatchInsectCell.swift
//  WatchOS Cross-Platform Extension
//
//  Created by Edgar Nzokwe on 6/12/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct WatchInsectCellView: View {
    var insect:Insect
    var body: some View {
        HStack{
            Image(insect.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Rectangle())
            
            VStack(alignment: .leading){
                Text(insect.name).font(.title)
                Text(insect.habitat)
            }.padding(.vertical)
        }
    }
}

struct WatchInsectCell_Previews: PreviewProvider {
    static var previews: some View {
        WatchInsectCellView(insect: testInsect)
    }
}
