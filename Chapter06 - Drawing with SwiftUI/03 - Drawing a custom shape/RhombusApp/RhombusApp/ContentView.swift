//
//  ContentView.swift
//  RhombusApp
//
//  Created by giordano scalzo on 26/02/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct Rhombus: Shape {
    func path(in rect: CGRect) -> Path {
        Path() { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.closeSubpath()
        }
    }
}

struct ContentView: View {
    var body: some View {
        Rhombus()
            .fill(Color.orange)
            .aspectRatio(0.7, contentMode: .fit)
            .padding(.horizontal, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
