//
//  ContentView.swift
//  MoreViewsAndControls
//
//  Created by Edgar Nzokwe on 9/20/20.
//

import SwiftUI


struct ContentView: View {
    @State private var progress = 0.5
    @State private var color  = Color.red
    @State private var secondColor  = Color.yellow
    @State private var someText = "Initial value"
    var body: some View {
        List{
            Section(header: Text("ProgressViews")) {
                ProgressView("Indefinite progress view")
                ProgressView("Downloading",value: progress, total:2)
                Button("More", action: { progress += 0.5 })
            }
            Section(header: Text("Labels")) {
                Label("Slow ", systemImage: "tortoise.fill")
                Label{
                    Text ("Fast")
                        .font(.title)
                }
                icon: {
                    Circle()
                        .fill(Color.orange)
                           .frame(width: 40, height: 20, alignment: .center)
                           .overlay(Text("F"))
                }
            }
            Section(header: Text("ColorPicker")) {
                ColorPicker(selection: $color ){
                    Text("Pick my background").background(color).padding()
                }
                ColorPicker("Picker", selection: $secondColor )
            }
            Section(header: Text("Link")) {
                Link("Packt Publishing", destination: URL(string: "https://www.packtpub.com/")!)
            }
            Section(header: Text("TextEditor")) {
                TextEditor(text: $someText)
                Text("current editor text:\n\(someText)")
            }
            Section(header: Text("Menu")) {
                Menu("Actions") {
                    Button("Set TextEditor to 'today'", action: {
                        someText = "Reset"
                    })
                    Button("Turn first picker green", action: {
                        color = Color.green
                    })
                }
            }
        }.listStyle(GroupedListStyle())
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

