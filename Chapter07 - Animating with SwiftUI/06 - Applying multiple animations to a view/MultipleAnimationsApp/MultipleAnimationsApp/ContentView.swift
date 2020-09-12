//
//  ContentView.swift
//  MultipleAnimationsApp
//
//  Created by giordano scalzo on 13/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State
    var initialState = true
    
    var body: some View {
        VStack(spacing: 30) {
            
            Rectangle()
                .fill(initialState ? Color.blue : Color.red)
                .cornerRadius(initialState ? 50 : 0)
                .offset(y: initialState ? 0 : -200)
                .rotation3DEffect(initialState ? .degrees(0)
                    : .degrees(45),
                                  axis: (x: 1, y: 0, z: 0))
                .animation(.easeInOut(duration: 2))
                .scaleEffect(initialState ? 1 : 0.8)
                .rotationEffect(initialState ? Angle(degrees:0) : Angle(degrees:-90))
                .animation(.linear(duration: 1))
                .frame(width: 300, height: 200)
            
            Button {
                initialState.toggle()
            } label: {
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
