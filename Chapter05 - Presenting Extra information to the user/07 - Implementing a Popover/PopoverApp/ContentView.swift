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
        Button("Show popover") {
            self.showPopover = true
        }.popover(
            isPresented: self.$showPopover,
            arrowEdge: .bottom
        ) {
            Text("Popover content displayed here")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
