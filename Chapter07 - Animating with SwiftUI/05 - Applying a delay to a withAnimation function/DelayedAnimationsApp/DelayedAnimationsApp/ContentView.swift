//
//  ContentView.swift
//  DelayedAnimationsApp
//
//  Created by giordano scalzo on 13/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct CustomText: ViewModifier {
    let foregroundColor: Color
    let backgroundColor: Color
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(foregroundColor)
            .frame(width: 200)
            .padding()
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
    }
}

struct ContentView: View {
    @State var hideFirst = true
    @State var hideSecond = true
    @State var hideThird = true
    var body: some View {
        VStack {
            VStack(spacing: 30) {
                Text("First")
                .modifier(CustomText(foregroundColor: .white, backgroundColor: .red, cornerRadius: 10))
                    .opacity(hideFirst ? 0 : 1)
            Text("Second")
                .modifier(CustomText(foregroundColor: .white, backgroundColor: .blue, cornerRadius: 10))
                .opacity(hideSecond ? 0 : 1)

            Text("Third")
                .modifier(CustomText(foregroundColor: .white, backgroundColor: .yellow, cornerRadius: 10))
                .opacity(hideThird ? 0 : 1)
            }
            
            Spacer()
            Button(action: {
                withAnimation(Animation.easeInOut) {
                    self.hideFirst.toggle()
                }
                withAnimation(Animation.easeInOut.delay(0.3)) {
                    self.hideSecond.toggle()
                }
                withAnimation(Animation.easeInOut.delay(0.6)) {
                    self.hideThird.toggle()
                }
            }) {
                Text("Animate")
                    .fontWeight(.heavy)
                    .modifier(CustomText(foregroundColor: .white, backgroundColor: .green, cornerRadius: 5))
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
