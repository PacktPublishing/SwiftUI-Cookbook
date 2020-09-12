//
//  ContentView.swift
//  CustomViewTransitionApp
//
//  Created by giordano scalzo on 14/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var moveScaleAndFade: AnyTransition {
        let insertion = AnyTransition
            .scale
            .combined(with: .move(edge: .leading))
            .combined(with: .opacity)
        let removal = AnyTransition
            .scale
            .combined(with: .move(edge: .top))
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
extension Image {
    func custom() -> some View {
        self
        .resizable()
        .aspectRatio(contentMode: .fit)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct FirstComponent: View {
    var body: some View {
        Image("ch7-r7-i1")
            .custom()
    }
}

struct SecondComponent: View {
    var body: some View {
        Image("ch7-r7-i2")
            .custom()
    }
}

struct ContentView: View {
    @State var showFirst = true
    var body: some View {
        VStack(spacing: 24) {
            if showFirst {
                FirstComponent()
                    .transition(.moveScaleAndFade)
                
            } else {
                SecondComponent()
                    .transition(.moveScaleAndFade)
            }
            Button {
                showFirst.toggle()
            } label: {
                Text("Change")
            }
        }
        .animation(Animation.easeInOut(duration: 1))
        .padding(.horizontal, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
