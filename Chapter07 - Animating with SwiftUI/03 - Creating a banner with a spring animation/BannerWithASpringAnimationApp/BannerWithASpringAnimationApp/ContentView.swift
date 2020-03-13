//
//  ContentView.swift
//  BannerWithASpringAnimationApp
//
//  Created by giordano scalzo on 13/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct Banner: View {
    let message: String
    var show: Bool
    
    var body: some View {
        Text(message)
            .font(.title)
            .frame(width:UIScreen.main.bounds.width - 20,
                   height: 100)
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(10)
            .offset(y: show ?
                -UIScreen.main.bounds.height / 3 :
                -UIScreen.main.bounds.height)
            .animation(.interpolatingSpring(mass: 2.0,
                                            stiffness: 100.0,
                                            damping: 10,
                                            initialVelocity: 0))
    }
}

struct ContentView: View {
    @State
    var show = false
    
    var body: some View {
        VStack {
            Banner(message: "Hello, World!", show: show)
            Button(action: {
                self.show.toggle()
            }) {
                Text(show ? "Hide" : "Show")
                    .padding()
                    .frame(width: 100)
                    .foregroundColor(.white)
                    .background(show ? Color.red : Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
