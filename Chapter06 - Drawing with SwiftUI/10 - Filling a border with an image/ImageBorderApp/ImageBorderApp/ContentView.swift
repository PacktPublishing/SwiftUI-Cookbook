//
//  ContentView.swift
//  ImageBorderApp
//
//  Created by giordano scalzo on 02/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Circle()
            .strokeBorder(ImagePaint(image: Image("JesterBackground"),
                               scale: 0.1),
                    lineWidth: 50)
            .aspectRatio(contentMode: .fit)
            .shadow(radius: 10)
            .padding([.horizontal], 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
