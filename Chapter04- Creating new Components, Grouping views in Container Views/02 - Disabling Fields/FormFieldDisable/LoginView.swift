//
//  LoginView.swift
//  FormFieldDisable
//
//  Created by Edgar Nzokwe on 4/22/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        VStack{
            Text("Amazing Games")
                .fontWeight(.heavy)
                .foregroundColor(.blue)
                .font(.largeTitle)
                .padding(.bottom, 30)
            
            Image(systemName: "person.circle")
                .font(.system(size: 150))
                .foregroundColor(.gray)
                .padding(.bottom,40)
            
            Group{
                TextField("Username", text: $username)
                SecureField("Password", text: $password)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            )

            Button(action: {
                print("Submit clicked")
            }){
                Text("Submit")
                }.padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .clipShape(Capsule())
            .disabled(username.isEmpty || password.isEmpty)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
