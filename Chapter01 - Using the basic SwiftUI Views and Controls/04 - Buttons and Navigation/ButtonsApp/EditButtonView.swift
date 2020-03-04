//
//  EditButtonView.swift
//  ButtonsApp
//
//  Created by Edgar Nzokwe on 3/3/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct EditButtonView: View {
    @State private var animals = ["Cats", "Dogs", "Goats"]
    var body: some View {
        List{
            ForEach(animals, id: \.self){ animal in
                Text(animal)
            }.onDelete(perform: removeAnimal)
        }
        .navigationBarItems(trailing:EditButton())
        .navigationBarTitle(Text("EditButtonView"), displayMode: .inline)
    }
    func removeAnimal(at offsets: IndexSet){
        animals.remove(atOffsets: offsets)
    }
}

struct EditButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonView()
    }
}
