//
//  ContentView.swift
//  PresentingMultipleAlerts
//
//  Created by Edgar Nzokwe on 5/17/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
             Toggle(isOn: $showTwoButtonsAlert) {
                 Text("Display second alerrt")
                     .font(.title)
                 }.padding()
                 
                 .alert(isPresented: $showTwoButtonsAlert){
                     
                    Alert(title: Text("Turn on the Switch?"), message:Text("Are you sure"), primaryButton: .default(Text("Yes"), action: {
                        self.showTwoButtonsAlert.toggle()
                    }), secondaryButton: .cancel(Text("No")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
