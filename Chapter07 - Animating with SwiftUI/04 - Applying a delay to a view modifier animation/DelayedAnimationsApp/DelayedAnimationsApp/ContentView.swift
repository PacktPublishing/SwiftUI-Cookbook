//
//  ContentView.swift
//  DelayedAnimationsApp
//
//  Created by giordano scalzo on 13/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State
    var change = false
    
    var body: some View {
        VStack(spacing: 30) {
            
            Rectangle()
                .fill(Color.blue)
                
                .offset(y: change ? -300 : 0)
                .animation(Animation
                    .easeInOut(duration: 1).delay(0))
                
                .scaleEffect(change ? 0.5 : 1)
                .animation(Animation
                    .easeInOut(duration: 1).delay(1))
                
                .rotation3DEffect(
                    change ? .degrees(45) : .degrees(0),
                            axis: (x: 1, y: 0, z: 0))
                .animation(Animation
                    .easeInOut(duration: 1).delay(2))
                
                .frame(width: 200, height: 200)
            
            Button(action: {
                change.toggle()
            }) {
                Text("Animate")
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                .cornerRadius(5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
