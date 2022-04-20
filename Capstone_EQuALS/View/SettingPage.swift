//
//  SettingPage.swift
//  forMilestone4
//
//  Created by Sheng hao Dong on 3/8/22.
//

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
                    .background(Color.semeticPink)
                    .padding(.horizontal, 30)
                
                Form {
                    Section {
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
