//
//  ContentView.swift
//  GradientViewsApp
//
//  Created by giordano scalzo on 29/02/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

extension Text {
    func bigLight() -> some View {
        self
            .font(.system(size: 80))
            .fontWeight(.thin)
            .foregroundColor(.white)
    }
}

struct LinearGradientView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors:
                    [.orange, .green, .blue, .black]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            Text("Linear Gradient")
                .bigLight()
        }
    }
}

struct RadialGradientView: View {
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors:
                        [.orange, .green, .blue, .black]),
                           center: .center,
                           startRadius: 20,
                           endRadius: 500)
            Text("Radial Gradient")
                .bigLight()
        }
    }
}

struct AngularGradientView: View {
    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(
                colors: [.orange, .green, .blue, .black,
                         .black, .blue, .green, .orange]),
                            center: .center)
            Text("Angular Gradient")
                .bigLight()
        }
    }
}

struct ContentView: View {
    @State
    private var selectedGradient = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            Group {
                if selectedGradient == 0 {
                    LinearGradientView()
                } else if selectedGradient == 1 {
                    RadialGradientView()
                } else {
                    AngularGradientView()
                }
            }.edgesIgnoringSafeArea(.all)
            
            Picker(selection: self.$selectedGradient,
                   label: Text("Select Gradient")) {
                    Text("Linear").tag(0)
                    Text("Radial").tag(1)
                    Text("Angular").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 32)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
