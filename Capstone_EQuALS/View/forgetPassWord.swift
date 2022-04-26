//
//  forgetPassWord.swift
//  Capstone_EQuALS
//
//  Created by Jiaqi Yang on 4/25/22.
//

import SwiftUI

struct forgetPassWord: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    findPassword()
                    Button(action: {
                        //confirm reset Password
                    }){
                        
                        confirmResetPassword()
                    }
                    Button(action: {
                        //cancel reset password
                        //either return to the login page
                        //or return to the setting page
                    }){
                        cancelResetPassword()
                    }
                }.padding()
            }.navigationTitle("Forget Password")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct forgetPassWord_Previews: PreviewProvider {
    static var previews: some View {
        forgetPassWord()
    }
}

struct findPassword:View{
    @State var userName: String = ""
    @State var EmailAddress: String = ""
    @State var confirmCode: String = ""
    @State var newPassword: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View{
        Text("Username").font(.body)
        TextField("",text: self.$userName)
            .padding(.vertical, 20)
            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
            .cornerRadius(5)
        
        Text("Email Address").font(.body)
        TextField("",text: self.$EmailAddress)
                .padding(.vertical, 20)
            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
            .cornerRadius(5)
       
        
        Text("New Password").font(.body)
        SecureField("",text: self.$newPassword)
            .padding(.vertical, 20)
            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
            .cornerRadius(5)
        
        Text("Confirm New Password").font(.body)
        SecureField("",text: self.$confirmPassword)
            .padding(.vertical, 20)
            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
            .cornerRadius(5)
    }
}




struct confirmResetPassword:View{
    var body: some View{
        Text("Confirm")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.LoginBlue)
            .cornerRadius(15.0)
    }
}


struct cancelResetPassword:View{
    var body: some View{
        Text("Cancel")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.LoginBlue)
            .cornerRadius(15.0)
    }
}
