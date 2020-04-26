//
//  ContentView.swift
//  SignInWithAppleApp
//
//  Created by giordano scalzo on 25/04/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct SignInWithApple: UIViewRepresentable {
    @Binding
    var name: String
    @Binding
    var email: String

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        let button = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black)
        button.addTarget(context.coordinator, action:  #selector(Coordinator.didTapButton),
                         for: .touchUpInside)
        return button
    }

    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }

    class Coordinator: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
        let parent: SignInWithApple?

        init(_ parent: SignInWithApple) {
            self.parent = parent
            super.init()

            guard let user = UserDefaults.standard.object(forKey: "userId") as? String ,
                let name = UserDefaults.standard.object(forKey: "username") as? String ,
                let email = UserDefaults.standard.object(forKey: "email") as? String else {
                    return
            }

            let appleIDProvider = ASAuthorizationAppleIDProvider()
            appleIDProvider.getCredentialState(forUserID: user) { (state, error) in
                DispatchQueue.main.async {
                    if case .authorized = state {
                        self.parent?.name = name
                        self.parent?.email = email
                    } else {
                        UserDefaults.standard.set(nil, forKey: "userId")
                    }
                }
            }
        }

        @objc
        func didTapButton() {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]

            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.presentationContextProvider = self
            authorizationController.delegate = self
            authorizationController.performRequests()
        }

        // ASAuthorizationControllerPresentationContextProviding
        func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
            let vc = UIApplication.shared.windows.last?.rootViewController
            return (vc?.view.window!)!
        }

        // ASAuthorizationControllerDelegate
        func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
            guard let credentials = authorization.credential as? ASAuthorizationAppleIDCredential else {
                print("credentials not found....")
                return
            }

            // Usually, Keychain is used for saving the credentials, but for  simplicity of this article, we use the UserDefaults.
            // Please don't doit in your production app!
            UserDefaults.standard.set(credentials.user, forKey: "userId")
            UserDefaults.standard.set(credentials.fullName?.givenName, forKey: "username")
            UserDefaults.standard.set(credentials.email, forKey: "email")
            parent?.name = credentials.fullName?.givenName ?? ""
            parent?.email = credentials.email ?? ""
        }

        func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        }
    }
}

struct ContentView: View {
    @State
    private var name : String = ""
    @State
    private var email : String = ""

    var body: some View {
        ZStack{
            Color.white
            if self.name.isEmpty{
                SignInWithApple(name: $name, email: $email)
                    .frame(width: 200, height: 50)
            }
            else{
                Text("Welcome\n\(self.name), \(email)")
                    .foregroundColor(.black)
                    .font(.headline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
