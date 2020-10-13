//
//  ContentView.swift
//  BasicAnimationsApp
//
//  Created by giordano scalzo on 12/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct AnimationType {
    let name: String
    let animation: Animation
    
    static var all: [AnimationType]  = [
        .init(name: "default", animation: .default),
        .init(name: "easeIn", animation: .easeIn),
        .init(name: "easeOut", animation: .easeOut),
        .init(name: "easeInOut", animation: .easeInOut),
        .init(name: "linear", animation: .linear),
        .init(name: "spring", animation: .spring()),
    ]
}

struct ContentView: View {
    @State
    private var onTop = false
    @State
    private var type =
        AnimationType(name: "default", animation: .default)
    @State
    private var showSelection = false
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Animations"),
                    buttons: AnimationType.all.map { type in
                        .default(Text(type.name),
                                 action:  {
                                    self.type = type
                        })
                        } + [ .destructive(Text("Cancel")) ]
        )
    }
    
    var body: some View {
        VStack(spacing: 12) {
            GeometryReader { geometry in
                HStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 80, height: 80)
                        .offset(y: onTop ?
                            -geometry.size.height/2 :
                            geometry.size.height/2)
                        .animation(Animation.default)
                    Spacer()
                    Circle()
                        .fill(Color.red)
                        .frame(width: 80, height: 80)
                        .offset(y: onTop ?
                            -geometry.size.height/2 :
                            geometry.size.height/2 )
                        .animation(type.animation)
                }
                .padding(.horizontal, 30)
            }
            Button { onTop.toggle() } label: {
                Text("Animate")
            }
            Button { showSelection = true } label: {
                Text("Choose Animation")
            }
            .actionSheet(isPresented: $showSelection,
                         content: {
                            actionSheet
            })
            Text("Current: \(type.name)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
