//
//  ContentView.swift
//  EditingListApp
//
//  Created by Edgar Nzokwe on 3/20/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["USA", "Canada", "England","Cameroon", "South Africa", "Mexico" , "Japan", "South Korea"]
    var body: some View {
        NavigationView{
            List {
                ForEach(countries, id: \.self) { country in
                    Text(country)
                }
                .onDelete(perform: self.deleteItem)
            }
            .navigationBarTitle("Countries", displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
        }
    }
    private func deleteItem(at indexSet: IndexSet){
        self.countries.remove(atOffsets: indexSet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
