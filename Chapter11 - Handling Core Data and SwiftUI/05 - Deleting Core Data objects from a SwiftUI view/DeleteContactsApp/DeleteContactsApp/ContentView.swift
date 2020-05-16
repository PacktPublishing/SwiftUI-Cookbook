//
//  ContentView.swift
//  DeleteContactsApp
//
//  Created by giordano scalzo on 16/05/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext)
    var managedObjectContext

    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Contact.lastName,
                            ascending: true),
            NSSortDescriptor(keyPath: \Contact.firstName,
                             ascending: true),
        ]
    )
    var contacts: FetchedResults<Contact>

    var body: some View {
        List {
            ForEach(contacts, id: \.self) { contact in
                HStack {
                    Text(contact.firstName ?? "-")
                    Text(contact.lastName ?? "-")
                    Spacer()
                    Text(contact.phoneNumber ?? "-")
                }
            }.onDelete(perform: deleteContact)
        }
    }

    private func deleteContact(at offsets: IndexSet) {
        guard let index = offsets.first else {
            return
        }

        managedObjectContext.delete(contacts[index])
        try? managedObjectContext.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
