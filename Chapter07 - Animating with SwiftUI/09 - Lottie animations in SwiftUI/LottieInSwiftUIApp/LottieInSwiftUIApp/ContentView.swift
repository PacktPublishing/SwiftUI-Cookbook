//
//  ContentView.swift
//  LottieInSwiftUIApp
//
//  Created by giordano scalzo on 15/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI
import Lottie

struct LottieAnimation: UIViewRepresentable {
    private let animationView = AnimationView()
    var animationName = ""
    
    @Binding
    var isToPlay: Bool
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        animationView.widthAnchor
            .constraint(equalTo: view.widthAnchor).isActive = true
        animationView.heightAnchor
            .constraint(equalTo: view.heightAnchor).isActive = true
        
        animationView.animation = Animation.named(animationName)
        animationView.contentMode = .scaleAspectFill
        animationView.scalesLargeContentImage = true
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        guard isToPlay else { return }
        
        animationView.play { _ in
            self.isToPlay = false
        }
    }
}


struct ContentView: View {
    @State
    private var isToPlay = false
    
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            VStack {
                LottieAnimation(animationName: "filling-heart",
                                isToPlay: $isToPlay)
                    .frame(width: 200, height: 200)
                Button(action: {
                    self.isToPlay = true
                }) {
                    Text("Fill me!")
                        .fontWeight(.heavy)
                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
