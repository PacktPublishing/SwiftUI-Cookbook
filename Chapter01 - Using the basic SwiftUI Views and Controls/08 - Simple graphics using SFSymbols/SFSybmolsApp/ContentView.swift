//
//  ContentView.swift
//  SFSybmolsApp
//
//  Created by Edgar Nzokwe on 3/8/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "c.circle.fill")
                Image(systemName: "o.circle.fill")
                Image(systemName: "o.circle.fill")
                Image(systemName: "k.circle.fill")
                Image(systemName: "b.circle.fill")
                Image(systemName: "o.circle.fill")
                Image(systemName: "o.circle.fill")
                Image(systemName: "k.circle.fill")
            }.foregroundColor(.blue)
                .font(.title)
                .padding()
            HStack{
                Image(systemName: "clock")
                    .foregroundColor(Color.purple)
                    .font(.largeTitle)
                Image(systemName: "wifi")
                .foregroundColor(Color.red)
                .font(.largeTitle)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
