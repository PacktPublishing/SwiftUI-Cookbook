//
//  Greetings.swift
//  AddSwiftUIToUIKitApp
//
//  Created by Edgar Nzokwe on 3/9/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct Greetings: View {
    var randomText = ""
    var body: some View {
        Text(randomText)
    }
}

struct Greetings_Previews: PreviewProvider {
    static var previews: some View {
        Greetings()
    }
}
