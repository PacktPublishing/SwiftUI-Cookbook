//
//  ContentView.swift
//  Cross-Platform-MacOS
//
//  Created by Edgar Nzokwe on 5/31/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   @State private var selectedInsect: Insect?
    @State var insects:[Insect] = []

    var body: some View {
        NavigationView{
            VStack {
                List(selection:$selectedInsect) {
                        ForEach(insects) {insect in
                            InsectCellView(insect:insect)
                        }
                }.listStyle(SidebarListStyle())
                
            }.frame(minWidth:225, maxWidth: 300)
            if selectedInsect != nil {
                InsectDetailView(insect: selectedInsect ?? testInsect)
                    
            }
        }.frame(minWidth: 700, minHeight: 300)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(insects: Self.testInsects)
    }
    static var testInsects : [Insect]{
        guard let url = Bundle.main.url(forResource: "insectData", withExtension: "json"),
        
            let data = try? Data(contentsOf: url)
            else{
                return[]
        }
        let decoder  = JSONDecoder()
        let array = try?decoder.decode([Insect].self, from: data)
        return array ??  [testInsect]
    }
}