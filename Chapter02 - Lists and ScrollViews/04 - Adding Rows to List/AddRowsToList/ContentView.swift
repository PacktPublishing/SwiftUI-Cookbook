//
//  ContentView.swift
//  AddRowsToList
//
//  Created by Edgar Nzokwe on 3/19/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var numbers = [1,2,3,4]
    var body: some View {
        NavigationView{
            List{
                ForEach(self.numbers, id:\.self){ number in
                    Text("\(number)")
                }
            }.navigationBarTitle("Number List", displayMode: .inline)
            .navigationBarItems(trailing: Button("Add", action: addItemToRow))
        }
    }
    private func addItemToRow() {
        self.numbers.append(Int.random(in: 0 ..< 100))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
