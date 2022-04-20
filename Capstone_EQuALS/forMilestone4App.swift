//
//  forMilestone4App.swift
//  forMilestone4
//
//  Created by Sheng hao Dong on 3/7/22.
//

import SwiftUI

// Define the observable
class AppState: ObservableObject {
    @Published var hasOnboarded: Int
    
    init(currentOnBoarded: Int) {
        self.hasOnboarded = currentOnBoarded
    }
}

@main
struct forMilestone4App: App {
    @ObservedObject var appState = AppState(currentOnBoarded: 0)
    
    var body: some Scene {
        WindowGroup {
            if appState.hasOnboarded == 0{
                loginPage()
                    .environmentObject(appState)
            }
            else if  appState.hasOnboarded == 1 {
                registerPage()
                    .environmentObject(appState)
            }
            else if  appState.hasOnboarded == 2{
                mainView()
                    .environmentObject(appState)
            }
        }
    }
}
