//
//  ContentView.swift
//  UsingLazyGrids
//
//  Created by Edgar Nzokwe on 9/18/20.
//

import SwiftUI

struct ContentView: View {
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    let colors: [Color] = [.green,.red, .yellow,.pink]
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing:20) {
                    ForEach(1...999, id:\.self){ item in
                        Text("Item \(item)")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 30, leading: 15, bottom: 30, trailing: 15))
                            .background(Color.blue)
                            .clipShape(Capsule())
                    }
                }
            }
            ScrollView(.horizontal) {
                LazyHGrid(rows: columns, spacing:20) {
                    ForEach(1...999, id:\.self){ item in
                        Text("Item \(item)")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 30, leading: 15, bottom: 30, trailing: 15))
                            .background(Color.blue)
                            .clipShape(Capsule())
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
