//
//  ContentView.swift
//  PresentingActionSheet
//
//  Created by Edgar Nzokwe on 5/21/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    var body: some View {
        Text("Present Sheet")
            .onTapGesture {
                self.showSheet = true
        }
        .actionSheet(isPresented: $showSheet){
            ActionSheet(
                title: Text("ActionSheet"),
                message: Text("Use Action sheet to give users alteratives to completing a task").font(.largeTitle),
                buttons: [
                    .default(Text("Dismiss Sheet")),
                    .default(Text("Save")),
                    .destructive(Text("Cancel")),
                    .default(Text("Print to console")){
                        print("Print button clicked")
                    }
            ])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
