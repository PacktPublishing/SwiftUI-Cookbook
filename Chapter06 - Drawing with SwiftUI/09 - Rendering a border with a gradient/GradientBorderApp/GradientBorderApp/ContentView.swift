//
//  ContentView.swift
//  GradientBorderApp
//
//  Created by giordano scalzo on 29/02/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct ProgressRing: Shape {
    private let startAngle = Angle.radians(1.5 * .pi)
    
    @Binding
    var progress: Double
    
    func path(in rect: CGRect) -> Path {
        Path() { path in
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.width / 2,
                startAngle: startAngle,
                endAngle: startAngle +
                    Angle(radians: 2 * Double.pi * progress),
                clockwise: false
            )
        }
    }
}

enum Gradients {
    static var linearGradient: some ShapeStyle {
        LinearGradient(
            gradient: Gradient(colors:
                [.orange, .yellow, .red]),
            startPoint: .top,
            endPoint: .bottom)
    }
    
    static var radialGradient: some ShapeStyle {
        RadialGradient(gradient:
            Gradient(colors:[.orange, .green]),
                       center: .center,
                       startRadius: 35,
                       endRadius: 450)
    }
    
    static var angularGradient: some ShapeStyle {
        AngularGradient(gradient: Gradient(
            colors: [.orange, .yellow, .red,
                     .yellow, .orange]),
                        center: .center)
    }
}

struct ContentView: View {
    @State
    private var selectedGradient = 0
    @State
    private var progressInternal: Double = 0.7
    
    private let strokeStyle = StrokeStyle(lineWidth: 60,
                                          lineCap: .round,
                                          lineJoin: .round)

    @ViewBuilder
    var progressRing: some View {
        if selectedGradient == 0 {
                ProgressRing(progress: $progressInternal)
                    .stroke(Gradients.linearGradient,
                        style: strokeStyle)
        } else if selectedGradient == 1 {
            ProgressRing(progress: $progressInternal)
                .stroke(Gradients.radialGradient,
                        style: strokeStyle)
        } else {
            ProgressRing(progress: $progressInternal)
                .stroke(Gradients.angularGradient,
                        style: strokeStyle)
        }
    }
    
    var body: some View {
        VStack() {
            Picker(selection: self.$selectedGradient,
                   label: Text("Select Gradient")) {
                    Text("Linear").tag(0)
                    Text("Radial").tag(1)
                    Text("Angular").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            Spacer()
            progressRing
            .aspectRatio(contentMode: .fit)
            Spacer()
            Slider(value: $progressInternal,
                   in: 0...1,
                   step: 0.01)
        }
        .padding(.horizontal, 60)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
