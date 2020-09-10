//
//  ContentView.swift
//  SignInWithAppleApp
//
//  Created by giordano scalzo on 29/08/2020.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    @AppStorage("storedName")
    private var storedName : String = "" {
        didSet {
            userName = storedName
        }
    }
    @AppStorage("storedEmail")
    private var storedEmail : String = "" {
        didSet {
            userEmail = storedEmail
        }
    }
    @AppStorage("userID")
    private var userID : String = ""
    
    @State
    private var userName: String = ""
    @State
    private var userEmail: String = ""
    
    var body: some View {
        ZStack{
            Color.white
            if userName.isEmpty{
                SignInWithAppleButton(.signIn, onRequest: onRequest, onCompletion: onCompletion)
                    .signInWithAppleButtonStyle(.black)
                    .frame(width: 200, height: 50)
            } else {
                Text("Welcome\n\(userName), \(userEmail)")
                    .foregroundColor(.black)
                    .font(.headline)
            }
        }
        .onAppear(perform: onAppear)
    }
    
    private func onRequest(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }
    
    private func onCompletion(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success (let authResults):
            guard let credential = authResults.credential
                    as? ASAuthorizationAppleIDCredential
            else { return }
            storedName = credential.fullName?.givenName ?? ""
            storedEmail = credential.email ?? ""
            userID = credential.user
        case .failure (let error):
            print("Authorization failed: " + error.localizedDescription)
        }
    }
    
    private func onAppear() {
        guard !userID.isEmpty else {
            userName = ""
            userEmail = ""
            return
        }
        
        ASAuthorizationAppleIDProvider()
            .getCredentialState(forUserID: userID) { state, _ in
                DispatchQueue.main.async {
                    if case .authorized = state {
                        userName = storedName
                        userEmail = storedEmail
                    } else {
                        userID = ""
                    }
                }
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
