//
//  ContentView.swift
//  DashedBorderShape
//
//  Created by giordano scalzo on 26/02/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("motorbike")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .shadow(radius: 10)
            .padding([.horizontal], 20)
            .overlay(
                Circle()
                    .strokeBorder(Color.black,
                                  style: StrokeStyle(
                                    lineWidth: 10,
                                    dash: [15, 5, 25]
                    ))
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
