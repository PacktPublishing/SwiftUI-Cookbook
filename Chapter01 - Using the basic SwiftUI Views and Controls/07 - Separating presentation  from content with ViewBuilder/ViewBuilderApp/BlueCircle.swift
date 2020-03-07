//
//  BlueCircle.swift
//  ViewBuilderApp
//
//  Created by Edgar Nzokwe on 3/7/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct BlueCircle<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
            HStack {
               content
                Spacer()
                Circle()
                    .fill(Color.blue)
                    .frame(width:20, height:30)
            }.padding()
    }
}


