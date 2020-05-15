//
//  ContentView.swift
//  AddContactsApp
//
//  Created by giordano scalzo on 14/05/2020.
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
    @State
    private var isAddContactPresented = false
    @Environment(\.managedObjectContext)
    private var managedObjectContext


    var body: some View {
        NavigationView {
            List(contacts, id: \.self) { contact in
                Text(contact.firstName ?? "-")
                Text(contact.lastName ?? "-")
                Spacer()
                Text(contact.phoneNumber ?? "-")
            }
            .navigationBarTitle("Contacts", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.isAddContactPresented.toggle()
                }) {
                    Image(systemName: "plus")
                        .font(.headline)
            })
                .sheet(isPresented: $isAddContactPresented) {
                    AddNewContact(isAddContactPresented:                                    self.$isAddContactPresented)
                        .environment(\.managedObjectContext,
                                     self.managedObjectContext)
            }
        }
    }
}

struct AddNewContact: View {
    @Environment(\.managedObjectContext)
    private var managedObjectContext

    @Binding
    var isAddContactPresented: Bool
    @State
    var firstName = ""
    @State
    var lastName = ""
    @State
    var phoneNumber = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Phone Number", text: $phoneNumber)
                    .keyboardType(.phonePad)
                Spacer()
            }
            .padding(16)
            .navigationBarTitle(Text("Add A New Contact"), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: saveContact) {
                    Image(systemName: "checkmark")
                        .font(.headline)
                }
                .disabled(isDisabled))
        }
    }

    private var isDisabled: Bool {
        firstName.isEmpty || lastName.isEmpty || phoneNumber.isEmpty
    }

    private func saveContact() {
        Contact.insert(in: managedObjectContext,
                       firstName: firstName,
                       lastName: lastName,
                       phoneNumber: phoneNumber)
        guard managedObjectContext.hasChanges else { return }
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
        isAddContactPresented.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
