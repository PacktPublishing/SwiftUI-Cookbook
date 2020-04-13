//
//  InsectsList.swift
//  UsingMockDataForPreviews
//
//  Created by Edgar Nzokwe on 4/12/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct InsectsList: View {
    var insects:[Insect] = []
    var body: some View {
        List {
            ForEach(insects) {insect in

                NavigationView {
                    HStack{
                        Text(insect.name)
                        Image(insect.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:100, height: 80)
                            .clipShape(Circle())
                        VStack{
                            Text(insect.name).font(.title)
                            Text(insect.habitat).padding()
                        }
                    }
                }
            }
        }    }
}

struct InsectsList_Previews: PreviewProvider {
    static var previews: some View {
        InsectsList()
    }
}
