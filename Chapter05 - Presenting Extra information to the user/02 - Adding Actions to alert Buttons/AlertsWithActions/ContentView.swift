//
//  ContentView.swift
//  AlertsWithActions
//
//  Created by Edgar Nzokwe on 5/17/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var changeText = false
    @State private var displayText = "Tap to Change Text"
    var body: some View {
        Text(displayText)
            .onTapGesture {
                self.changeText = true
        }
        .alert(isPresented: $changeText){
                Alert(title: Text("Changing Text"),
                      message: Text("Do you want to change the displayed text"),
                      primaryButton: .cancel(),
                      secondaryButton: .default(Text("OK")){
                self.displayText = (self.displayText == "Stay Foolish") ? "Stay Hungry" : "Stay Foolish"
            }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
