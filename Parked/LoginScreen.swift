//
//  LoginScreen.swift
//  Parked
//
//  Created by Matthew Michel on 8/27/19.
//  Copyright © 2019 Matthew Michel. All rights reserved.
//

import SwiftUI

extension CredentialsOrError {
  var isSuccess: Bool {
    switch self {
    case .credentials: return true
    case .error: return false
    }
  }
  
  var values: (user: String, givenName: String?, familyName: String?, email: String?)? {
    switch self {
    case let .credentials(user: user, givenName: givenName, familyName: familyName, email: email): return (user: user, givenName: givenName, familyName: familyName, email: email)
    case .error: return nil
    }
  }
  
  var error: Error? {
    switch self {
    case .credentials: return nil
    case .error(let error): return error
    }
  }
}

struct LoginScreen: View {
    
    @State var credentials: CredentialsOrError?
    @State var loggedIn: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Parked")
                .font(.largeTitle)
                .fontWeight(.light)
            HStack{
                SignInWithAppleButton(credentials: $credentials)
                    .padding(.bottom)
            }
            
            Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                Text("or sign in with email")
                    .font(.footnote)
            }
            
        }.background(Image("login-screen-background")
            .opacity(0.4))
            .sheet(isPresented: $loggedIn) {
                ContentView()
        }
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
