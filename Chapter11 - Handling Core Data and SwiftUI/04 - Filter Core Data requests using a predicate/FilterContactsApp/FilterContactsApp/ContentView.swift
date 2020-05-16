//
//  ContentView.swift
//  FilterContactsApp
//
//  Created by giordano scalzo on 15/05/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding
        var text: String
        init(text: Binding<String>) {
            _text = text
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

struct FilteredContacts: View {
    var fetchRequest: FetchRequest<Contact>

    init(filter: String) {
        let predicate: NSPredicate? = filter.isEmpty ?
            nil :
            NSPredicate(format: "lastName BEGINSWITH %@", filter)
        fetchRequest = FetchRequest<Contact>(
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Contact.lastName,
                                ascending: true),
                NSSortDescriptor(keyPath: \Contact.firstName,
                                 ascending: true)],
            predicate: predicate)
    }

    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { contact in
            Text(contact.firstName ?? "-")
            Text(contact.lastName ?? "-")
            Spacer()
            Text(contact.phoneNumber ?? "-")
        }
    }
}

struct ContentView: View {
    @State
    private var searchText : String = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                FilteredContacts(filter: searchText)
            }
            .navigationBarTitle("Contacts", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
