//
//  SettingPage.swift
//  forMilestone4
//
//  Created by Sheng hao Dong on 3/8/22.
//  Edited by Jiaqi Yang on 4/25/22

import SwiftUI

class settingViewModel: ObservableObject {
    @Published var isUserCurrentlyLoggedOut = false

    func handleSignOut() {
        print("toggle log out status")
        isUserCurrentlyLoggedOut.toggle()
        try? FirebaseManager.shared.auth.signOut()
    }
}

struct SettingPage: View {
    @State var shouldShowLogOutOptions = false
    
    @ObservedObject private var vm = settingViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Setting")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(Color.LoginBlue)
                Divider()
                    .frame(height: 2)
                    .background(Color.LoginBlue)
                    .padding(.horizontal, 30)
               
                
                Form {
                    Section {
                        //show user info
                        HStack{
                            showUserPicture()
                            
                            showUserInfo()
                            Spacer()
                            
                        }
                        
                        //show security part
                        personalInfoPart()
                        
                        Button {
                            shouldShowLogOutOptions.toggle()
                        } label: {
                            Text("Sign Out")
                        }
                    }
                }
                Spacer()
                
            }
            
            .navigationTitle("s")
            .navigationBarHidden(true)
        }
        .actionSheet(isPresented: $shouldShowLogOutOptions) {
            .init(title: Text("Settings"), message: Text("What do you want to do?"), buttons: [
                .destructive(Text("Sign Out"), action: {
                    print("handle sign out")
                    vm.handleSignOut()
                }),
                .cancel()
            ])
        }
        .fullScreenCover(isPresented: $vm.isUserCurrentlyLoggedOut, onDismiss: nil) {
            loginPage {
                self.vm.isUserCurrentlyLoggedOut = false
            }
        }
    }
}

struct SettingPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage()
    }
}

struct showUserPicture: View{
    var body:some View{
            Button(action: {
            }){
                Image("user picture")
                    .renderingMode(.original)
                    .padding()
            }
            .background(Color.white)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 1))

    }
}
struct showUserInfo:View{
    //get username and userEmail from the database
    @State private var username: String = ""
    
    var body:some View{
       
            VStack{
                //show user name
                Text("UserName: ")
                    .fontWeight(.bold)
                    .font(.system(size: 15.0))
                    .foregroundColor(.black)
               + Text("User456").fontWeight(.bold)
                    .font(.system(size: 15.0))
                    .foregroundColor(.gray)
                    
                //show user email
                Text("Email:  ")
                    .fontWeight(.bold)
                    .font(.system(size: 15.0))
                    .foregroundColor(.black)
               + Text("abcd@g.com")
                    .fontWeight(.bold)
                    .font(.system(size: 15.0))
                    .foregroundColor(.gray)
                    
            }
            
    
        
       
        
    }
}

struct personalInfoPart:View{
    var body:some View{
        
        Button(action: {
            //go to setting_updateUserName
        }){
            
            Text("Update UserName")
        }
        Button(action: {
            // go to
        }){
            Text("Update Email Address")
        }
        
        Button(action: {
            // go to
        }){
            Text("Update PassName")
        }
        
    }
}
