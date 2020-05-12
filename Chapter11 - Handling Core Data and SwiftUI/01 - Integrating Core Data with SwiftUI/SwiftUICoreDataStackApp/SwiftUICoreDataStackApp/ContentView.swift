//
//  ContentView.swift
//  SwiftUICoreDataStackApp
//
//  Created by giordano scalzo on 10/05/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext)
    var managedObjectContext

    var body: some View {
        Text("\(managedObjectContext)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
