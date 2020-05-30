//
//  ContentView.swift
//  PopoverApp
//
//  Created by Edgar Nzokwe on 5/24/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showPopover = false
    var body: some View {
        Button(action: {
            self.showPopover = true
        }){
            Text("Show popover").font(.system(size: 40))
        }.popover(
            isPresented: self.$showPopover,
            arrowEdge: .bottom
        ) {
            Text("Popover content displayed here")
            .font(.system(size: 40))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
