//
//  ContentView.swift
//  BuiltInShapesApp
//
//  Created by giordano scalzo on 26/02/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Rectangle()
                .stroke(Color.orange,
                        lineWidth: 15)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red)
            Capsule(style: .continuous)
                .fill(Color.green)
                .frame(height: 100)
            Capsule(style: .circular)
                .fill(Color.yellow)
                .frame(height: 100)
            Circle()
                .strokeBorder(Color.blue, lineWidth: 15)
            Ellipse()
                .fill(Color.purple)
        }
        .padding([.horizontal], 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
