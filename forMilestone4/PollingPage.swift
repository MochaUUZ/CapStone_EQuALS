//
//  PollingPage.swift
//  forMilestone4
//
//  Created by Sheng hao Dong on 3/8/22.
//

import SwiftUI

struct PollingPage: View {
    var body: some View {
        VStack {
            Text("Join Session")
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

struct PollingPage_Previews: PreviewProvider {
    static var previews: some View {
        PollingPage()
    }
}
