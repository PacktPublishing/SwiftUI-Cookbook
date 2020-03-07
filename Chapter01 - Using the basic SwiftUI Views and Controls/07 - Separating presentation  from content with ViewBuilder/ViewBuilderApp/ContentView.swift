//
//  ContentView.swift
//  ViewBuilderApp
//
//  Created by Edgar Nzokwe on 3/7/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            BlueCircle {
                Text("some text here")
                Rectangle()
                .fill(Color.red)
                .frame(width: 40, height: 40)
            }
            BlueCircle {
                Text("Another example")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


