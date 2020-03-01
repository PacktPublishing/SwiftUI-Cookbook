//
//  ContentView.swift
//  AceOfSpadeApp
//
//  Created by giordano scalzo on 27/02/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct BezierShape: Shape {
    let bezierPath: UIBezierPath

    func path(in rect: CGRect) -> Path {
        let ratio = min(rect.width, rect.height)
        let transform = CGAffineTransform(scaleX: ratio, y: ratio)
        return Path(bezierPath.cgPath).applying(transform)
    }
}

struct ContentView: View {
    var body: some View {
        BezierShape(bezierPath: .spade)
            .aspectRatio(contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
