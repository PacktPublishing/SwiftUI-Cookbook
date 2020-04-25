//
//  LoginView.swift
//  FormFieldDisable
//
//  Created by Edgar Nzokwe on 4/22/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var username = ""
    @State var password = ""
    var body: some View {
        VStack{
            AppName()
            UserImage()
                .padding(.bottom,30)
            Group{
                TextField("Username", text: $username)
                SecureField("Password", text: $password)
            }.padding()
            .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .cornerRadius(10.0)
                .padding()
            
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

struct AppName: View {
    var body: some View {
        Text("Amazing App")
            .fontWeight(.heavy)
            .foregroundColor(.blue)
            .font(.largeTitle)
            .padding(.bottom, 30)
    }
}

struct UserImage: View {
    var body: some View {
        Image(systemName: "person.circle")
            .font(.system(size: 150))
            .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))

    }
}
