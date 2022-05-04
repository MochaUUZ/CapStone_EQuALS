//
//  setting-changePassword.swift
//  Capstone_EQuALS
//
//  Created by Jiaqi Yang on 4/25/22.
//

import SwiftUI

struct setting_changePassword: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    changePassword()
                    Button(action: {
                        //confirm UpdatePasswordContent
                    }){
                        confirmUpdatePasswordContent()
                    }
                    /*
                    
                    Button(action: {
                        //return to setting page
                    }){
                        cancelUpdatePasswordContent()
                    }
                     */
                }.padding()
            }.navigationTitle("Update Password").foregroundColor(Color.blue1)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct setting_changePassword_Previews: PreviewProvider {
    static var previews: some View {
        setting_changePassword()
    }
}
 
struct changePassword: View{
    
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmNewPassword: String = ""
    
    var body: some View{
        Text("Current Password")
            .fontWeight(.bold)
            .foregroundColor(.blue1)
            .padding(.top, 20)
        SecureField("",text: self.$currentPassword)
            .padding(.vertical, 20)
            .background(Color.grayLight1)
            .cornerRadius(5)
        
        Text("New Password")
            .fontWeight(.bold)
            .foregroundColor(.blue1)
            .padding(.top, 20)
        SecureField("",text: self.$newPassword)
            .padding(.vertical, 20)
            .background(Color.grayLight1)
            .cornerRadius(5)
        
        
        Text("Confirm New Password")
            .fontWeight(.bold)
            .foregroundColor(.blue1)
            .padding(.top, 20)
        SecureField("",text: self.$confirmNewPassword)
            .padding(.vertical, 20)
            .background(Color.grayLight1)
            .cornerRadius(5)
        
        Text("Your password must be at least 8 char.")
            .fontWeight(.light)
            .foregroundColor(.gray1)
            .padding(.top, 20)
        /*
        Text("Forgot Password?")
            .foregroundColor(Color.lightBlue)
            .font(.body)
            .onTapGesture {
               //forgot password
            }
        */
        NavigationLink("Forget password?") {
            forgetPassWord()
            
        }.foregroundColor(Color.blueLink1)
    }
}

struct confirmUpdatePasswordContent: View {
    var body: some View {
        
        Text("Confirm")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.green1)
            .cornerRadius(15.0)
    }
}
/*
struct cancelUpdatePasswordContent: View {
    var body: some View {
        Text("Cancel")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.LoginBlue)
            .cornerRadius(15.0)
    }
}
*/
