//
//  home.swift
//  forMilestone4
//
//  Created by Sheng hao Dong on 3/7/22.
//

import SwiftUI
import Firebase

class mainViewViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var isUserCurrentlyLoggedOut = false
    
    init() {
        DispatchQueue.main.async {
            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
            print("User is currently: \(self.isUserCurrentlyLoggedOut)")
        }
    }
    
    func handleSignOut() {
        print("toggle log out status")
        isUserCurrentlyLoggedOut.toggle()
        try? FirebaseManager.shared.auth.signOut()
    }
}

struct mainView: View {
    // @EnvironmentObject var appState: AppState
    
    @ObservedObject public var vm = mainViewViewModel()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemFill
        UITabBar.appearance().barTintColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                    
                }
            
            PollingPage()
                .tabItem {
                    Label("Polling", systemImage: "antenna.radiowaves.left.and.right.circle")
                }
            
            HistoryPage()
                .tabItem {
                    Label("History", systemImage: "clock.arrow.circlepath")
                }
            
            SettingPage()
                .tabItem {
                    Label("Setting", systemImage: "person.fill")
                }
    }
        .fullScreenCover(isPresented: $vm.isUserCurrentlyLoggedOut, onDismiss: nil) {
            loginPage {
                self.vm.isUserCurrentlyLoggedOut = false
            }
        }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
}
