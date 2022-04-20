//
//  ContentView.swift
//  forMilestone4
//
//  Created by Sheng hao Dong on 3/7/22.
//

import SwiftUI

struct loginPage: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack(alignment: .leading) {
            companyName()
            welcomeMessage()
            credentialField()
            Button(action: {appState.hasOnboarded = 2}) {
                LoginButtonContent()}
            thirdPartyLogin()
            Button(action: {appState.hasOnboarded = 1}) {
                goToRegisterPage()
                }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        loginPage()
    }
}

struct companyName: View {
    var body: some View {
        /*
         Text("EQuALS")
            .font(.system(size: 60))
            .fontWeight(.black)
            .foregroundColor(Color.companyColor)
           */
        
            
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
            .padding(.top)
        Text("Please, sign in to continue")
            .font(.caption)
            .foregroundColor(Color.gray)
            .fontWeight(.semibold)
            .padding(.bottom)
        
    }
}

struct credentialField: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("User Name")
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.horizontal, 30).padding(.top, 20)
            TextField("between 6-64 char.", text: $username)
                .padding(.horizontal, 30)
                .font(.body)
            Divider()
                .background(Color.blue)
                .padding(.horizontal, 30)
            
            Text("Password")
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.horizontal, 30).padding(.top, 20)
            
            SecureField("at least 8 char.", text: $password)
                .padding(.horizontal, 30)
                .font(.body)
                
            Divider()
                .background(Color.blue)
                .padding(.horizontal, 30)
            Text("Forgot Password?")
                .foregroundColor(Color.lightBlue)
                .padding()
                .font(.body)
            
        }
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
            Text("Don't have an account? Sign up")
                .foregroundColor(Color.lightBlue)
            Spacer()
        }
    }
}
