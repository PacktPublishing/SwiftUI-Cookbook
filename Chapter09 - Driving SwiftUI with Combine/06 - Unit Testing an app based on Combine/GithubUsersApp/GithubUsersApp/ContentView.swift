//
//  ContentView.swift
//  GithubUsersApp
//
//  Created by giordano scalzo on 05/04/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI
import Combine

struct GithubUser: Decodable, Identifiable {
    let id: Int
    let login: String
    let avatarUrl: String
}

class Github: ObservableObject {
    @Published
    var message: String = ""
    @Published
    var users: [GithubUser] = []
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    func load() {
        let url = URL(string: "https://api.github.com/users")!
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        URLSession.shared
            .dataTaskPublisher(for: URLRequest(url: url))
            .map(\.data)
            .decode(type: [GithubUser].self, decoder: decoder)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.message = error.localizedDescription
                }
            }, receiveValue: {
                self.users = $0
            })
            .store(in: &cancellableSet)
    }
}

struct ContentView: View {
    @ObservedObject
    private var github = Github()
    
    var body: some View {
        Group {
            if !github.users.isEmpty {
                List {
                    ForEach(github.users) { user in
                        GithubUserView(user: user)
                    }
                }
                .padding(.horizontal)
            } else {
                Button(action: {
                    self.github.load()
                }) {
                    Text("Load users")
                        .foregroundColor(.white)
                        .frame(width: 120, height: 50)
                        .background(Color.green)
                }
            }
        }
    }
}

struct GithubUserView: View {
    let user: GithubUser
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(user.login)")
            Text("\(user.avatarUrl)")
                .font(.system(.footnote))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
