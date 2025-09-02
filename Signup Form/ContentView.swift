//
//  ContentView.swift
//  Signup Form
//
//  Created by Aftaab Mulla on 19/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var showAlert : Bool = false
    @State private var showUsernameError : Bool = false
    @State private var showEmailError : Bool = false
    @State private var showPasswordError : Bool = false
    
    var body: some View {
        ZStack {
            Color("BackColor")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("SignUp Form")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.bottom, 10)
                
                // Username
                TextField("Enter your Name", text: $name)
                    .foregroundColor(.black)
                    .font(.system(size: 15, weight: .semibold))
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                if showUsernameError {
                    Text("⚠️ Please enter username")
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                // Email
                TextField("Enter your Email", text: $email)
                    .foregroundColor(.black)
                    .font(.system(size: 15, weight: .semibold))
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding(.horizontal)
                
                if showEmailError {
                    Text("⚠️ Please enter email")
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                // Password
                SecureField("Enter your Password", text: $password)
                    .foregroundColor(.black)
                    .font(.system(size: 15, weight: .semibold))
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                if showPasswordError {
                    Text("⚠️ Please enter password")
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                // Submit button
                Button(action: {
                    // Reset errors first
                    showUsernameError = false
                    showEmailError = false
                    showPasswordError = false
                    
                    // To check all fields are not empty
                    var isValid = true
                    
                    if name.isEmpty {
                        showUsernameError = true
                        isValid = false
                    }
                    if email.isEmpty {
                        showEmailError = true
                        isValid = false
                    }
                    if password.isEmpty {
                        showPasswordError = true
                        isValid = false
                    }
                    
                    if isValid {
                        showAlert = true
                        
                        // ✅ Reset fields after successful submit
                                name = ""
                                email = ""
                                password = ""
                    }
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(Color.blue)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .padding(.top, 50)
        }
        .alert("SignUp Completed", isPresented: $showAlert) {
            Button("OK") {}
        } message: {
            Text("Thanks for Signing Up, \(name)!")
        }
    }
}

#Preview {
    ContentView()
}
