//
//  HistoryPage.swift
//  forMilestone4
//
//  Created by Sheng hao Dong on 3/8/22.
//

import SwiftUI

struct HistoryPage: View {
    var body: some View {
        VStack {
            Text("History")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundColor(Color.LoginBlue)
            Divider()
                .frame(height: 2)
                .background(Color.semeticPink)
                .padding(.horizontal, 30)
            Spacer()
        }
    }
}

struct HistoryPage_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPage()
    }
}
