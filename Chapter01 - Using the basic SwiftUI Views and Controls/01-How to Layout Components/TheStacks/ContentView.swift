//
//  ContentView.swift
//  TheStacks
//
//  Created by Edgar Nzokwe on 2/27/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Group{
            VStack(alignment: .leading, spacing: CGFloat(5)){
                Text("Item 1")
                Text("Item 2")
                Divider().background(Color.black)
                Spacer()
                Text("Item 3")
                HStack{
                    Text("Item 1")
                    Text("Item 2")
                    Divider().background(Color.black)
                    Spacer()
                    Text("Item 3")
                }.background(Color.red)
                ZStack{
                               Text("Item 1")
                                .padding()
                                .background(Color.green)
                                .opacity(0.8)
                               Spacer()
                    Text("Item 2")
                    .padding()
                        .background(Color.green)
                        .offset(x: 80, y: -400)
                }
            }.background(Color.blue)
            
           
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

