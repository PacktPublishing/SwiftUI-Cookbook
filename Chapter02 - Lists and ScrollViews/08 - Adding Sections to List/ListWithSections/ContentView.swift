//
//  ContentView.swift
//  ListWithSections
//
//  Created by Edgar Nzokwe on 3/20/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView{
            List {
                Section(header: Text("North America")){
                    Text("USA")
                    Text("Canada")
                    Text("Mexico")
                    Text("Panama")
                    Text("Anguila")
                }
                Section(header: Text("South America")){
                    Text("Brazil")
                    Text("Argentina")
                    Text("Chile")
                    Text("Colombia")
                }
                Section(header: Text("Africa")){
                    Text("Nigeria")
                    Text("Ghana")
                    Text("Kenya")
                    Text("Senegal")
                }
                Section(header: Text("Europe")){
                    Text("Spain")
                    Text("France")
                    Text("Sweden")
                    Text("Finland")
                    Text("UK")
                }
                Section(header: Text("Asia ")){
                    Text("India")
                    Text("Japan")
                    Text("China")
                    Text("South Korea")
                    Text("Malaysia")
                }
                Section(header: Text("Oceania")){
                    Text("Australia")
                    Text("New Zealand")
                    Text("Fiji")
                    Text("Vanuatu")
                    Text("Palau")
                }
            }
        .listStyle(GroupedListStyle())
            .navigationBarTitle("Continents and Countries", displayMode: .inline)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
