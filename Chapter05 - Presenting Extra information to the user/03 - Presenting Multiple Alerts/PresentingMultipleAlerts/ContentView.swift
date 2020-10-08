//
//  ContentView.swift
//  PresentingMultipleAlerts
//
//  Created by Edgar Nzokwe on 5/17/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showTwoButtonsAlert = false
    @State private var showSimpleAlert = false
    var body: some View {
        VStack{
            Button("Show Two Button Alert"){
                showTwoButtonsAlert = true
            }.padding()
                 .alert(isPresented: $showTwoButtonsAlert){
                    Alert(title: Text("Turn on the Switch?"), message:Text("Are you sure"),
                          primaryButton: .default(Text("Yes")), secondaryButton: .cancel(Text("No")))
            }
            Button("Display other alert"){
                showSimpleAlert = true
            }.alert(isPresented: $showSimpleAlert){
                Alert(title: Text("Minimalist Alert"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
