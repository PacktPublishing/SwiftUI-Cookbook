//
//  ContentView.swift
//  DynamicTodoApp
//
//  Created by giordano scalzo on 29/03/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 8)
            .autocapitalization(.none)
            .frame(height: 40)
            .background(Color.white)
            .cornerRadius(5)
    }
}
struct InputTodoView: View {
    @State
    private var newTodoDescription: String = ""
    
    @Binding
    var todos: [Todo]
    
    var body: some View {
        HStack {
            TextField("Todo", text: $newTodoDescription)
                .textFieldStyle(CustomTextFieldStyle())
            Spacer()
            Button(action: {
                guard !newTodoDescription.isEmpty else {
                    return
                }
                todos.append(Todo(description: newTodoDescription, done: false))
                newTodoDescription = ""
            }) {
                Text("Add")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(5)
            }
        }
        .frame(height: 60)
        .padding(.horizontal, 24)
        .padding(.bottom, 30)
        .background(Color.gray)
    }
}


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
            ZStack(alignment: .bottom) {
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
                InputTodoView(todos: $todos)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
