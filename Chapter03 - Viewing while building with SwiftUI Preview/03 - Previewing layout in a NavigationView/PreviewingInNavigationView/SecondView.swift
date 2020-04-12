//
//  SecondView.swift
//  PreviewingInNavigationView
//
//  Created by Edgar Nzokwe on 3/30/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    var someText:String
    var body: some View {
        Text(someText)
            .navigationBarTitle("Second View ", displayMode: .inline)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(someText: "Testing")
        NavigationView{
            SecondView(someText: "Testing")
        }
    }
}
