//
//  ContentView.swift
//  ContextMenuApp
//
//  Created by Edgar Nzokwe on 5/23/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var bulbColor = Color.red
    var body: some View {
        Image(systemName: "lightbulb.fill")
            .font(.system(size: 60))
            .foregroundColor(bulbColor)
          .contextMenu{
              
            Button("Yellow Bulb"){
                self.bulbColor = Color.yellow
            }
            Button("Blue Bulb"){
                self.bulbColor = Color.blue
            }
            Button("Green Bulb"){
                self.bulbColor = Color.green
            }
      }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
