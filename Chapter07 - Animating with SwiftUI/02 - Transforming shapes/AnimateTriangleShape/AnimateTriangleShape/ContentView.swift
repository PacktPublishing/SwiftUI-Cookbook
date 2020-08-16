//
//  ContentView.swift
//  AnimateTriangleShape
//
//  Created by giordano scalzo on 13/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    var multiplier: CGFloat
    var animatableData: CGFloat {
        get { multiplier }
        set { multiplier = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX,
                                  y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX,
                                     y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX,
                                     y: rect.maxY
                                        - multiplier * rect.width))
            path.closeSubpath()
        }
    }
}

struct ContentView: View {
    @State
    var multiplier: CGFloat = 1
    
    var body: some View {
        Triangle(multiplier: multiplier)
            .fill(Color.red)
            .frame(width: 300, height: 300)
            .onTapGesture {
                withAnimation(.easeOut(duration: 2)) {
                    multiplier = CGFloat
                        .random(in: 0.3...1.5)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
