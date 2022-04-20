//
//  registerPage.swift
//  forMilestone4
//
//  Created by Jiaqi Yang on 3/8/22.
//

import SwiftUI

struct registerPage: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {appState.hasOnboarded = 0}){
                returnToLoginPage().padding(.trailing)
            }
            
            registerInfo()
            acceptRules()
            Button(action: {appState.hasOnboarded = 2}) {
                ContinueButtonContent()}
            thirdPartyLogin()
           
        }.padding()
    }
}


struct registerPage_Previews: PreviewProvider {
    static var previews: some View {
        registerPage()
    }
}

struct returnToLoginPage:View{
    var body: some View {
        Button(action: {
        }){
            Image("return")
                .renderingMode(.original)
                .padding()
        }
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 1))
    }
}

struct registerInfo:View{
    @State var registerUserName: String = ""
    @State var EmailAddress: String = ""
    @State var registerPassword: String = ""
    @State var confirmPassword: String = ""
    var body: some View {
        VStack(alignment: .leading){
            Text("Username").font(.body)
            TextField("",text: self.$registerUserName).frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
                .cornerRadius(5)
            
            Text("Email Address").font(.body)
            TextField("",text: self.$registerUserName)
                .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical, 20)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
                .cornerRadius(5)
            Text("Password").font(.body)
            SecureField("",text:self.$registerPassword).frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
                .cornerRadius(5)
            Text("Confirm Password").font(.body)
            SecureField("",text:self.$registerPassword).frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
                .cornerRadius(5)
        }
    }
}

struct acceptRules:View{
    @State var checkedTermsAndConditions: Bool=false;
    @State var checkedEndUserLicenseAgreement: Bool=false;
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Button(action:{
                    self.checkedTermsAndConditions=(!checkedTermsAndConditions)
                }){
                    Image(checkedTermsAndConditions
                          ?"checkBox-true":"checkBox-false")
                        .renderingMode(.original)
                }
                Text("Accept")
                    .font(.caption)
                    .foregroundColor(Color.black)
                Button(action:{
                    //open terms and conditions
                }){
                    Text("Terms and conditions")
                        .font(.caption)
                        .foregroundColor(Color.lightBlue)
                }
            }
            
            HStack {
                Button(action:{
                    self.checkedEndUserLicenseAgreement=(!checkedEndUserLicenseAgreement)
                }){
                    Image(checkedEndUserLicenseAgreement
                          ?"checkBox-true":"checkBox-false")
                        .renderingMode(.original)
                }
                Text("Accept")
                    .font(.caption)
                    .foregroundColor(Color.black)
                Button(action:{
                    //open terms and conditions
                }){
                    Text("End User License Agreement")
                        .font(.caption)
                        .foregroundColor(Color.lightBlue)
                }
                
            }
            
        }
        
    }
}

struct ContinueButtonContent:View{
    var body: some View {
        
        Text("Continue")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.LoginBlue)
            .cornerRadius(15.0)
        
    }
}
