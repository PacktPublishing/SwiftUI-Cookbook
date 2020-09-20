//
//  ContentView.swift
//  UsingExpandingLists
//
//  Created by Edgar Nzokwe on 9/19/20.
//

import SwiftUI

struct ContentView: View {
    let items = [currencies,tools]
    var body: some View {
        List(items, children: \.content){ row in
            Image(systemName: row.icon)
            Text(row.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Bagpack: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var content: [Bagpack]?
}
let dollar = Bagpack(name: "Dollar", icon: "dollarsign.circle")
let yen = Bagpack(name: "Yen",icon: "yensign.circle")
let currencies = Bagpack(name: "Currencies", icon: "coloncurrencysign.circle", content: [dollar, yen])

let pencil = Bagpack(name: "Pencil",icon: "pencil.circle")
let hammer = Bagpack(name: "Hammer",icon: "hammer")
let paperClip = Bagpack(name: "Paperclip",icon: "paperclip")
let glass = Bagpack(name: "Magnifying glass", icon: "magnifyingglass")
let bin  = Bagpack(name: "Bin", icon: "arrow.up.bin", content: [paperClip, glass])
let tools = Bagpack(name: "Tools", icon: "folder", content: [pencil, hammer,bin])
