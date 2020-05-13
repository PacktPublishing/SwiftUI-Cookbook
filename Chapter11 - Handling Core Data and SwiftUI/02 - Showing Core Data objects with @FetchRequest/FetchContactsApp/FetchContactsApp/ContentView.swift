//
//  ContentView.swift
//  FetchContactsApp
//
//  Created by giordano scalzo on 13/05/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Contact.lastName, ascending: true),
            NSSortDescriptor(keyPath: \Contact.firstName, ascending: true),
        ]
    )
    var contacts: FetchedResults<Contact>

    var body: some View {
        List(contacts, id: \.self) { contact in
            Text(contact.firstName ?? "-")
            Text(contact.lastName ?? "-")
            Spacer()
            Text(contact.phoneNumber ?? "-")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
