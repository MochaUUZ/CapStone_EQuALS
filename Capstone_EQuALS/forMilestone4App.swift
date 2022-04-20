//
//  forMilestone4App.swift
//  forMilestone4
//
//  Created by Sheng hao Dong on 3/7/22.
//

import SwiftUI

// Define the observable
class AppState: ObservableObject {
    @Published var hasOnboarded: Bool
    
    init(currentOnBoarded: Bool) {
        self.hasOnboarded = currentOnBoarded
    }
}

@main
struct forMilestone4App: App {
    @ObservedObject var appState = AppState(currentOnBoarded: false)
    
    var body: some Scene {
        WindowGroup {
            mainView()
//            if appState.hasOnboarded {
//                mainView()
//                    .environmentObject(appState)
//            }
//            else {
//                loginPage(didCompleteLoginProcess: {
//
//                })
//                    .environmentObject(appState)
//            }
        }
    }
}
