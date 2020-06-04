//
//  ContentView.swift
//  SnapshotTestingApp
//
//  Created by giordano scalzo on 01/06/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let cards: [(title: String, color: Color)] = [
        ("Visa Card", .yellow),
        ("Mastercard Credit Card", .red),
        ("Apple Credit Card", .black),
    ]
    var body: some View {
        VStack(spacing: 16) {
            ForEach(0..<cards.count) { index in
                Text(self.cards[index].title)
                    .font(.system(.title))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(self.cards[index].color)
                    .cornerRadius(16)
            }
        }.padding(.horizontal, 16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
