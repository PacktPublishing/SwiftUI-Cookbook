//
//  ModalWithNavView.swift
//  ModalViewApp
//
//  Created by Edgar Nzokwe on 5/22/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ModalWithNavView: View {
    @Binding var sheetWithNav: Bool
    var body: some View {
        NavigationView{
            Text("Sheet with navigation")
                .navigationBarTitle(Text("Sheet title"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action:{
                    self.sheetWithNav = false;
                }){
                    Text("Done")
                })
        }
        
    }
}

struct ModalWithNavView_Previews: PreviewProvider {
    static var previews: some View {
        ModalWithNavView(sheetWithNav: .constant(true))
    }
}
