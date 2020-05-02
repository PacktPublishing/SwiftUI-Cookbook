//
//  NewNote.swift
//  FirebaseNotesApp
//
//  Created by giordano scalzo on 02/05/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import Foundation
import SwiftUI

struct NewNote: View {
    @State
    private var title: String = ""
    @State
    private var bodyText: String = ""

    @Binding
    var isNewNotePresented: Bool

    var repository: NotesRepository

    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                TextField("Title", text: $title)
                    .padding(4)
                    .border(Color.gray)
                MultilineTextView(text: $bodyText)
                    .border(Color.gray)
            }
            .padding(32)
            .navigationBarTitle("New Note", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.repository.newNote(title: self.title,
                                            date: Date(),
                                            body: self.bodyText)
                    self.isNewNotePresented.toggle()
                }) {
                    Image(systemName: "checkmark")
                        .font(.headline)
                }
                .disabled(title.isEmpty)
            )
        }
    }
}

struct MultilineTextView: UIViewRepresentable {
    @Binding
    var text: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.delegate = context.coordinator
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator : NSObject, UITextViewDelegate {
        var parent: MultilineTextView

        init(_ uiTextView: MultilineTextView) {
            self.parent = uiTextView
        }

        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text ?? ""
        }
    }
}
