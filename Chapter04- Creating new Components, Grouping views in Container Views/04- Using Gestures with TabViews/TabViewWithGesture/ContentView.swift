//
//  ContentView.swift
//  TabViewWithGesture
//
//  Created by Edgar Nzokwe on 5/1/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelected = 0
    var body: some View {
        TabView(selection: $tabSelected){
            Text("Left Tab")
                .onTapGesture {
                    self.tabSelected = 1
            }.tag(0)
                .tabItem{
                    Image(systemName: "l.circle.fill")
                    Text("Left")
            }
            Text("Right Tab")
                .onTapGesture {
                        self.tabSelected = 0
                }
                .tabItem{
                    Image(systemName: "r.circle.fill")
                    Text("Right")
            }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
