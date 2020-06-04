//
//  InsectListView.swift
//  Cross-Platform-MacOS
//
//  Created by Edgar Nzokwe on 5/31/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct InsectListView: View {
    @Binding var selectedInsect:Insect?
    @State var insects:[Insect] = []
    var body: some View {
        
            VStack {
                List(selection:$selectedInsect) {
                        ForEach(insects) {insect in
                            InsectCellView(insect:insect)
                        }
                }.listStyle(SidebarListStyle())
            }.frame(minWidth:225, maxWidth: 300)
            
        
    }
}

struct InsectListView_Previews: PreviewProvider {
    static var previews: some View {
        InsectListView(selectedInsect: .constant(Self.testInsects[0]), insects: Self.testInsects)
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
