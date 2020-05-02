//
//  ShowNote.swift
//  FirebaseNotesApp
//
//  Created by giordano scalzo on 02/05/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import Foundation
import SwiftUI

struct ShowNote: View {
    let note: Note
    var body: some View {
        VStack(spacing: 12) {
            Text(note.title)
                .font(.headline)
                .fontWeight(.bold)
            ReadonlyTextView(text: note.body)
                .border(Color.gray)
        }
        .padding(32)
    }
}

struct ReadonlyTextView: UIViewRepresentable {
    var text: String
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = false
        view.isUserInteractionEnabled = true
        return view
    }
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
