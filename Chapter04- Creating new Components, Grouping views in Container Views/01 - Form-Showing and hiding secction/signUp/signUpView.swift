//
//  signUpView.swift
//  signUp
//
//  Created by Edgar Nzokwe on 4/22/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct signUpView: View {
    @State private var fname = ""
    @State private var lname = ""
    @State private var street = ""
    @State private var city = ""
    @State private var zip = ""
    @State private var yearsLived = false
    @State private var username = ""
    @State private var password1 = ""
    @State private var password2 = ""
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("First Name", text: $fname)
                    TextField("Last Name" , text: $lname)
                }
                Section{
                    TextField("Street Address" , text: $street)
                    TextField("City" , text: $city)
                    TextField("Zip" , text: $zip)
                    Toggle(isOn: $yearsLived){
                        Text("Have you lived here for 2+ years")
                    }
                }
                if !yearsLived{
                    Section{
                        TextField("Street Address" , text: $street)
                        TextField("City" , text: $city)
                        TextField("Zip" , text: $zip)
                    }
                }
                Section {
                    TextField("Create Username" , text: $username)
                    SecureField("Password", text: $password1)
                    SecureField("Re-enter Password", text: $password2)
                }
                
                Button(action: {
                    ///
                }){
                    Text("Submit")
                  
                }
              
            }.navigationBarTitle("Sign Up")
        }
    }
}

struct signUpView_Previews: PreviewProvider {
    static var previews: some View {
        signUpView()
    }
}
