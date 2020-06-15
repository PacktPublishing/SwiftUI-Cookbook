//
//  ContentView.swift
//  MacOS Cross-Platform
//
//  Created by Edgar Nzokwe on 6/8/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State  var selectedInsect: Insect?
    @EnvironmentObject var userData: InsectData
    var body: some View {
        NavigationView{
            VStack{
                MacInsectListView(selectedInsect: $selectedInsect)
            }.frame(minWidth: 290, maxWidth: 350)
            if selectedInsect != nil  {
                ScrollView{
                    InsectDetailView(insect: selectedInsect!)
                }
            
            }
        }.frame(minWidth: 650, minHeight:  300)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(InsectData())
    }
}
