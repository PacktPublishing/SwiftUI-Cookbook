//
//  ContentView.swift
//  UsingTabViews
//
//  Created by Edgar Nzokwe on 4/25/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
            }
            CurrenciesView()
                .tabItem{
                    Image(systemName: "coloncurrencysign.circle.fill")
                    Text("Currencies")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
