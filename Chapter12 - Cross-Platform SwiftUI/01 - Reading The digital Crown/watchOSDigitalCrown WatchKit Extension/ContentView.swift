//
//  ContentView.swift
//  watchOSDigitalCrown WatchKit Extension
//
//  Created by Edgar Nzokwe on 5/31/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var scrollValue = 0.0
    var body: some View {
        Text("Scroll value: \(scrollValue)")
        .focusable()
        .digitalCrownRotation($scrollValue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
