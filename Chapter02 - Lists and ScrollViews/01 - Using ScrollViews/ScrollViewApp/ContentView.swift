//
//  ContentView.swift
//  ScrollViewApp
//
//  Created by Edgar Nzokwe on 3/15/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let imageNames = [
        "a.circle.fill",
        "b.circle.fill",
        "c.circle.fill",
        "d.circle.fill",
        "e.circle.fill",
        "f.circle.fill",
        "g.circle.fill",
        "h.circle.fill",
        "i.circle.fill",
        "j.circle.fill",
        "k.circle.fill",
        "l.circle.fill",
    ]
    var body: some View {
        VStack{
            ScrollView {
                    ForEach(self.imageNames, id: \.self){ name in
                        Image(systemName: name)
                            .font(.largeTitle)
                            .foregroundColor(Color.yellow)
                            .frame(width: 50, height: 50)
                            .background(Color.blue)
                    }
            }
            .frame(width:50, height:200)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(self.imageNames, id: \.self){ name in
                        Image(systemName: name)
                            .font(.largeTitle)
                            .foregroundColor(Color.yellow)
                            .frame(width: 50, height: 50)
                            .background(Color.blue)
                    }
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
