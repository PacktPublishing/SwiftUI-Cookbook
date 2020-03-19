//
//  ContentView.swift
//  TicTacToeApp
//
//  Created by giordano scalzo on 28/02/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct Nought: View {
    var body: some View {
        Circle()
            .stroke(Color.red, lineWidth: 10)
    }
}

struct CrossShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path() { path in
            
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            
            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct Cross: View {
    var body: some View {
        CrossShape()
            .stroke(Color.green, style:
                StrokeStyle(lineWidth: 10,
                            lineCap: .round,
                            lineJoin: .round))
    }
}

struct Cell: View {
    @State private var isVisible = false
    @State private var isNought = false
    @Binding var isNextNought: Bool
    
    var body: some View {
        ZStack {
            Nought()
                .opacity((isVisible && isNought) ? 1 : 0)
            Cross()
                .opacity((isVisible && !isNought) ? 1 : 0)
            
        }
        .padding(20)
        .contentShape(Rectangle())
        .onTapGesture {
            guard !self.isVisible else {
                return
            }
            self.isVisible = true
            self.isNought = self.isNextNought
            self.isNextNought.toggle()
        }
    }
}

struct GridShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path() { path in
            
            path.move(to: CGPoint(x: rect.width/3,
                                  y: rect.minY))
            path.addLine(to: CGPoint(x: rect.width/3,
                                     y: rect.maxY))
            
            path.move(to: CGPoint(x: 2*rect.width/3,
                                  y: rect.minY))
            path.addLine(to: CGPoint(x: 2*rect.width/3,
                                     y: rect.maxY))
            
            path.move(to: CGPoint(x: rect.minX,
                                  y: rect.height/3))
            path.addLine(to: CGPoint(x: rect.maxX,
                                     y: rect.height/3))
            
            path.move(to: CGPoint(x: rect.minX,
                                  y: 2*rect.height/3))
            path.addLine(to: CGPoint(x: rect.maxX,
                                     y: 2*rect.height/3))
        }
    }
}

struct Row: View {
    @Binding
    var isNextNought: Bool
    
    var body: some View {
        HStack {
            Cell(isNextNought: $isNextNought)
            Cell(isNextNought: $isNextNought)
            Cell(isNextNought: $isNextNought)
        }
    }
}

struct Grid: View {
    @State
    var isNextNought: Bool = false
    
    var body: some View {
        ZStack {
            GridShape()
                .stroke(Color.blue, lineWidth: 15)
            VStack {
                Row(isNextNought: $isNextNought)
                Row(isNextNought: $isNextNought)
                Row(isNextNought: $isNextNought)
            }
        }
        .aspectRatio(contentMode: .fit)
    }
}

struct ContentView: View {
    var body: some View {
        Grid()
            .padding(.horizontal, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
