//
//  ContentView.swift
//  MenuApp
//
//  Created by giordano scalzo on 06/06/2020.
//  Copyright © 2020 Giordano Scalzo. All rights reserved.
//

import SwiftUI

extension Font {
    static func oleoBold(size: CGFloat) -> Font {
        .custom("OleoScriptSwashCaps-Bold", size: size)
    }
    static func oleoRegular(size: CGFloat) -> Font {
        .custom("OleoScriptSwashCaps-Regular", size: size)
    }
    static func sacramento(size: CGFloat) -> Font {
        .custom("Sacramento-Regular", size: size)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
        Text("Casa Mia")
            .font(.oleoBold(size: 60))
            Text("Restaurant")
                .font(.oleoRegular(size: 60))
            Text("Pizza Margherita")
                .font(.sacramento(size: 40))
            Text("Fettuccine Alfredo")
                .font(.sacramento(size: 40))
            Text("Pollo Arrosto")
                .font(.sacramento(size: 40))
            Text("Insalata di Riso")
                .font(.sacramento(size: 40))
            Text("Gelato")
                .font(.sacramento(size: 40))
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
