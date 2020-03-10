//
//  ContentView.swift
//  UIkitToSwiftUI
//
//  Created by Edgar Nzokwe on 3/8/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var animate = true
    var body: some View {
        VStack{
            ActivityIndicator(animating:  animate)
            HStack{
                Toggle(isOn: $animate){
                    Text("Toggle Activity")
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
