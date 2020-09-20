//
//  ContentView.swift
//  StretchableHeaderApp
//
//  Created by giordano scalzo on 16/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

extension GeometryProxy {
    private var offset: CGFloat {
        frame(in: .global).minY
    }

    var height: CGFloat {
        size.height + (offset > 0 ? offset : 0)
    }
    
    var verticalOffset: CGFloat {
        offset > 0 ? -offset : 0
    }
}

struct StretchableHeader: View {
    let imageName: String
    
    var body: some View {
        GeometryReader { geometry in
            Image(self.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width,
                       height: geometry.height)
                .offset(y: geometry.verticalOffset)
        }
        .frame(height: 300)
    }
}

struct Row: View {
    var body: some View {
        HStack {
            Image("avatar")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            Spacer()
            VStack(alignment: .trailing) {
                Text("Billie Eilish")
                    .fontWeight(.heavy)
                Text("Bad guy")
            }
        }
        .padding(.horizontal, 15)
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                StretchableHeader(imageName: "header")
                ForEach(0..<6) { _ in
                    Row()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
