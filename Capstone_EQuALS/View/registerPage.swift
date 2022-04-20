//
//  registerPage.swift
//  forMilestone4
//
//  Created by Jiaqi Yang on 3/8/22.
//

import SwiftUI

struct registerPage: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    registerInfo()
                }.padding()
            }.navigationTitle("Create Account")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    struct registerInfo: View {
        @State var registerUserName: String = ""
        @State var EmailAddress: String = ""
        @State var registerPassword: String = ""
        @State var confirmPassword: String = ""
        
        @State var loginStatusMessage = ""
        
        @State var checkedTermsAndConditions = false
        @State var checkedEndUserLicenseAgreement = false

        var body: some View {
            VStack(alignment: .leading){
                Text("Username").font(.body)
                TextField("",text: self.$registerUserName)
                    .padding(.vertical, 20)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
                    .cornerRadius(5)
                
                Text("Email Address").font(.body)
                TextField("",text: self.$EmailAddress)
                        .padding(.vertical, 20)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
                    .cornerRadius(5)
                
                Text("Password").font(.body)
                SecureField("",text: self.$registerPassword)
                    .padding(.vertical, 20)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
                    .cornerRadius(5)
                
                Text("Confirm Password").font(.body)
                SecureField("",text: self.$confirmPassword)
                    .padding(.vertical, 20)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
                    .cornerRadius(5)
            }
            
            // Accept rules portion
            VStack(alignment: .leading){
                HStack {
                    Button {
                        self.checkedTermsAndConditions.toggle()
                    } label: {
                        Image(checkedTermsAndConditions ? "checkBox-true" : "checkBox-false")
                    }
                    Text("Accept")
                        .font(.caption)
                        .foregroundColor(Color.black)
                    NavigationLink("Terms and conditions") {
                        // Should go to term and conditions page
                        loginPage {
                            
                        }
                    }
                }
                
                HStack {
                    Button {
                        self.checkedEndUserLicenseAgreement.toggle()
                    } label: {
                        Image(checkedEndUserLicenseAgreement ? "checkBox-true" : "checkBox-false")
                    }
                    Text("Accept")
                        .font(.caption)
                        .foregroundColor(Color.black)
                    NavigationLink("End User License Agreement") {
                        // should go to end user license agreement page
                        loginPage {
                            
                        }
                    }
                }
            }
            
            // Continue button portion
            Button {
                // Create account and pop to login page
                createNewAccount()
            } label: {
                ContinueButtonContent()
            }
            
            // Display register status message
            Text(self.loginStatusMessage)
                .foregroundColor(.red)
        }
        
        private func createNewAccount() {
            if registerPassword != confirmPassword {
                self.loginStatusMessage = "Password confirmation not equal"
                print("Password confirmation not equal")
                return
            }
            else if checkedTermsAndConditions == false || checkedEndUserLicenseAgreement == false{
                self.loginStatusMessage = "Please check terms and license agreement"
                print("Terms or license agreement not agree")
                return
            }
            else {
                FirebaseManager.shared.auth.createUser(withEmail: EmailAddress, password: confirmPassword) { result, err in
                    if let err = err {
                        print("Failed to create user: ", err)
                        self.loginStatusMessage = "Failed to create user: \(err)"
                        return
                    }
                    print("Successfully created user: \(result?.user.uid ?? "Err")")
                    self.loginStatusMessage = "Successfully created user: \(result?.user.uid ?? "Err")"
                    
                    self.storeUserInformation()
                }
            }
        }
        
        private func storeUserInformation() {
            guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
            let userData = [Constants.email: self.EmailAddress, Constants.uid: uid, Constants.username: self.registerUserName]
            FirebaseManager.shared.firestore.collection("users")
                .document(uid).setData(userData) { err in
                    if let err = err {
                        print(err)
                        self.loginStatusMessage = "\(err)"
                        return
                    }
                    
                    print("Successfully store user information")
                    // self.didCompleteLoginProcess()
                }
        }
    }

    struct ContinueButtonContent: View {
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


    struct registerPage_Previews: PreviewProvider {
        static var previews: some View {
            registerPage()
        }
    }
}
