//
//  ContentView.swift
//  StaticTodoApp
//
//  Created by giordano scalzo on 29/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct Todo: Identifiable, Equatable {
    let id = UUID()
    let description: String
    var done: Bool
}

private extension Array where Element == Todo {
    mutating func toggleDone(to todo: Todo) {
        guard let index = self.firstIndex(
            where: { $0 == todo }
            ) else { return }
        
        self[index].done.toggle()
    }
}
struct ContentView: View {
    @State
    private var todos: [Todo] = [
        .init(description: "review first chapter", done: false),
        .init(description: "buy wine", done: false),
        .init(description: "paint kitchen", done: false),
        .init(description: "cut the grass", done: false),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todo in
                    HStack {
                        Text(todo.description)
                            .strikethrough(todo.done)
                        Spacer()
                        Image(systemName:
                            todo.done ?
                                "checkmark.square" :
                            "square")
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        todos.toggleDone(to: todo)
                    }
                }
            }.navigationBarTitle("TODOs")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
