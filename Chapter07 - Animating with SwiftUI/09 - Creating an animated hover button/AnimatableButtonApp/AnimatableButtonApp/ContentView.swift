//
//  ContentView.swift
//  AnimatableButtonApp
//
//  Created by giordano scalzo on 15/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

extension CGPoint {
    func isContained(in geometry: GeometryProxy) -> Bool {
        geometry.frame(in: .global).contains(self)
    }
}

struct AnimatableButton: View {
    @State
    private var isPressed: Bool = false
    
    let text: String
    let action: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            Text(self.text)
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.heavy)
                .frame(width: geometry.size.width,
                       height: geometry.size.height)
                .background(Color.red)
                .shadow(radius: 10)
                .cornerRadius(15)
                
                .gesture(DragGesture(minimumDistance: 0,
                                     coordinateSpace: .global)
                        .onChanged { dragGesture in
                            isPressed = dragGesture
                                .location.isContained(in: geometry)
                        }
                        .onEnded { dragGesture in
                            isPressed = false
                            if dragGesture.location.isContained(in: geometry) {
                                action()
                            }
                    }
            )
        }
        .frame(width: 200, height: 100)
        .scaleEffect(self.isPressed  ? 1.2 : 1)
        .animation(.easeInOut(duration: 0.5))
    }
}

struct ContentView: View {
    var body: some View {
        AnimatableButton(text: "Press Me") {
            print("Pressed")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
