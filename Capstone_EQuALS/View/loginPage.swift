//
//  ContentView.swift
//  forMilestone4
//
//  Created by Sheng hao Dong on 3/7/22.
//

import SwiftUI
import Firebase

struct loginPage: View {
    // Determining login status
    let didCompleteLoginProcess: () -> ()
    
    //@EnvironmentObject var appState: AppState
    
    @State private var isEmailMode = true
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    
    @State var loginStatusMessage = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    companyName()
                    welcomeMessage()

                    // Credential portion
                    Picker(selection: $isEmailMode, label: Text("Picker here")) {
                        Text("Email")
                            .tag(true)
                        Text("Username")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle()).padding()

                    // credential
                    VStack(alignment: .leading, spacing: 8){
                        Text(isEmailMode ? "Email" : "Username")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 30).padding(.top, 20)
                        if isEmailMode {
                            TextField("email@domain-name", text: $email)
                                .padding(.horizontal, 30)
                                .font(.body)
                        }
                        else {
                            TextField("between 6-64 char.", text: $username)
                                .padding(.horizontal, 30)
                                .font(.body)
                        }
                        Divider().background(Color.blue).padding(.horizontal, 30)
                        
                        Text("Password")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 30).padding(.top, 20)
                        SecureField("at least 8 char.", text: $password)
                            .padding(.horizontal, 30)
                            .font(.body)
                        Divider().background(Color.blue).padding(.horizontal, 30)
                        
                        Text("Forgot Password?")
                            .foregroundColor(Color.lightBlue)
                            .padding()
                            .font(.body)
                            .onTapGesture {
                                // Perform forgot password step
                            }
                    }
                    
                    Button {
                        handleLoginAction()
                    } label: {
                        LoginButtonContent()
                    }
                    // Display error message if occur
                    Text(self.loginStatusMessage)
                        .foregroundColor(.red)
                    
                    thirdPartyLogin()
                    goToRegisterPage()
                }.padding()
            }
        }
    }
    
    private func handleLoginAction() {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to login user: ", err)
                self.loginStatusMessage = "Failed to login user: \(err)"
                return
            }
            
            print("Successfully logged in as user: \(result?.user.uid ?? "Err")")
            
            self.loginStatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "Err")"
            
            self.didCompleteLoginProcess()
        }
    }
    
    struct companyName: View {
        var body: some View {
                
            Text("EQuALS")
                    .font(.system(size: 50.0))
                    .fontWeight(.black)
                    .foregroundColor((Color.companyColor))
            + Text("TM")
                .font(.system(size: 20.0))
                .fontWeight(.bold)
                .foregroundColor(Color.companyColor)
                .baselineOffset(30.0)
        }
    }
    
    struct welcomeMessage: View {
       
        var body: some View {
           
            Text("Welcome!")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
            Text("Please, sign in to continue")
                .font(.caption)
                .foregroundColor(Color.gray)
                .fontWeight(.semibold)
                .padding(.bottom)
            
        }
    }
    
    struct LoginButtonContent: View {
        var body: some View {
            Text("Sign In")
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.LoginBlue)
                .cornerRadius(15.0)
        }
    }
    
    struct thirdPartyLogin: View {
        var body: some View {
            HStack{
                Spacer()
                Button(action: {
                    
                }){
                    Image("facebook")
                        .renderingMode(.original)
                        .padding()
                }
                .background(Color.LoginBlue)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("twitter")
                        .renderingMode(.original)
                        .padding()
                }
                .background(Color.LoginBlue)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                
                Spacer()
            }.padding()
        }
    }
    
    struct goToRegisterPage: View {
        var body: some View {
            HStack {
                Spacer()
                NavigationLink("Don't have an account? Sign up") {
                    registerPage()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        loginPage(didCompleteLoginProcess: {
            
        })
    }
}
