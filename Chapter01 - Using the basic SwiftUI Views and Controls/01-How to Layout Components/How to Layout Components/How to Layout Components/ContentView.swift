//
//  ContentView.swift
//  How to Layout Components
//
//  Created by Edgar Nzokwe on 2/27/20.
//  Copyright © 2020 charmcitysoft. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Group{
            VStack(alignment: .leading, spacing: CGFloat(5)){
                Text("Item 1")
                Text("Item 2")
                Divider().background(Color.black)
                Text("Item 3")
                Spacer()
               }
            HStack{
                Text("Item 1")
                Text("Item 2")
                Divider().background(Color.black)
                Text("Item 3")
                Spacer()
            }
            ZStack{
                Text("Item 1")
                Spacer()
                Text("Item 2")
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

