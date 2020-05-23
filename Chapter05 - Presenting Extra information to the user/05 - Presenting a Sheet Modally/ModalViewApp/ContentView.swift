//
//  ContentView.swift
//  ModalViewApp
//
//  Created by Edgar Nzokwe on 5/21/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal = false
    @State private var sheetWithNav = false;
    var body: some View {
        VStack {
            Button("Display Sheet"){
                self.showModal = true
            }.sheet(isPresented: $showModal){
                ModalView()
            }
            
            Button("SheetWithNavigationBar"){
                self.sheetWithNav = true
            }.sheet(isPresented: $sheetWithNav){
                ModalWithNavView(sheetWithNav: self.$sheetWithNav)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
