//
//  ContentView.swift
//  TestingSwiftUIApp
//
//  Created by giordano scalzo on 04/06/2020.
//  Copyright © 2020 Giordano Scalzo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let countries = [
        "USA",
        "France",
        "Germany",
        "Italy"
    ]
    @State
    var originCountry: Int = 0
    var didAppear: ((Self) -> Void)?
    
    var body: some View {
        VStack(spacing: 12) {
            Text("What is your country of origin?")
            HStack(spacing: 12) {
                ForEach(0..<countries.count) { idx in
                    Button {
                        originCountry = idx
                    } label: {
                        Text(countries[idx])
                            .frame(width: 80, height: 40)
                            .background((originCountry == idx ?
                                Color.red :
                                Color.blue)
                                .opacity(0.6))
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                    
                }
            }
            Spacer()
            Text(countries[originCountry])
                .font(.system(size: 40))
            Spacer()
        }
        .onAppear { didAppear?(self) }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
