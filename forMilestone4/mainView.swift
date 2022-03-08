//
//  home.swift
//  forMilestone4
//
//  Created by Sheng hao Dong on 3/7/22.
//

import SwiftUI

struct mainView: View {
    @EnvironmentObject var appState: AppState
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
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
}
