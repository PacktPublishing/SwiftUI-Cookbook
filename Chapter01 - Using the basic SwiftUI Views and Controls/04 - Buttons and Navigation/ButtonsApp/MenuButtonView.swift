//
//  MenuButtonView.swift
//  ButtonsApp
//
//  Created by Edgar Nzokwe on 3/3/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct MenuButtonView: View {
    var body: some View {
        Text("MenuButtons are deprecated but available on MacOS only")
            .padding()
            .navigationBarTitle("MenuButtons", displayMode: .inline)
        /*
        MenuButton("country +") {
            Button("USA") { print("Selected USA") }
                .background(Color.accentColor)
            Button("India") { print("Selected India") }
        }
         */
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView()
    }
}
