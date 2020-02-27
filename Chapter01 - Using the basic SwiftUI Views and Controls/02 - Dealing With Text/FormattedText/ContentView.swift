//
//  ContentView.swift
//  FormattedText
//
//  Created by Edgar Nzokwe on 2/27/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Hello World")
            Text("Large Title Text")
                .font(.largeTitle)
            Text("Bold Text")
                .bold()
            Text("Changing text color")
                .foregroundColor(Color.blue)
            Text("Use kerning to change space between lines of text")
                .kerning(7)
            Text("Changing font weight").fontWeight(.semibold)
            Text("Strikethrough")
                .strikethrough()
            Text("Underline")
                .underline()
            Text("Italisized text")
                .italic()
            Text("This is a multiline text implemented in swiftUI. The trailing modifier was added to the text. This text also implements multiple modifiers")
                .multilineTextAlignment(.trailing)
                .lineSpacing(10)
                .background(Color.yellow)
            
    
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
