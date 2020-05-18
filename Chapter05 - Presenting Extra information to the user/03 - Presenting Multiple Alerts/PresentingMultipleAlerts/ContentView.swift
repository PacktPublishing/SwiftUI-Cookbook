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
             Toggle(isOn: $showTwoButtonsAlert) {
                 Text("Display alert")
                 }.padding()
                 
                 .alert(isPresented: $showTwoButtonsAlert){
                    Alert(title: Text("Turn on the Switch?"), message:Text("Are you sure"),
                          primaryButton: .default(Text("Yes"), action: {
                        self.showTwoButtonsAlert = true
                    }), secondaryButton: .cancel(Text("No")))
            }
            Button("Display other alert"){
                self.showSimpleAlert = true
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
