//
//  home.swift
//  forMilestone4
//
//  Created by Sheng hao Dong on 3/8/22.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack(alignment: .leading) {
            CompanyName()
            WelcomeBanner()
            ProgramSelector()
            Spacer()
        }
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

struct CompanyName: View {
    var body: some View {
        HStack {
            Spacer()
            Text("EQuALS")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(Color.companyColor)
            
            + Text("TM")
                .font(.system(size: 15.0))
                .fontWeight(.bold)
                .foregroundColor(Color.companyColor)
                .baselineOffset(22.0)
            Spacer()
        }
    }
}

struct WelcomeBanner: View {
    var body: some View {
        Label(title: {Text("Good Morning! User456")
                .font(.headline)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .padding()
        },
              icon: {Image(systemName: "sun.max.circle.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, Color.semeticPink)
                .font(.system(size: 40))
        })
            .frame(maxWidth: .infinity)
            .background(Color.LoginBlue)
    }
}

struct ProgramSelector: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Available Programs")
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
            HStack {
                Text("")
                    .frame(width: 150, height: 150)
                    .background(Color.gray)
                Spacer()
                Text("")
                    .frame(width: 150, height: 150)
                    .background(Color.gray)
            }.padding(.bottom, 30)
            
            HStack {
                Text("")
                    .frame(width: 150, height: 150)
                    .background(Color.gray)
                Spacer()
                Text("")
                    .frame(width: 150, height: 150)
                    .background(Color.gray)
            }
            Button(action: {}) {
                Text("Begin or Continue Exam")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.LoginBlue)
                    .cornerRadius(15.0)
            }
            .padding(.top, 30)
        }
        .padding(.leading, 35)
        .padding(.top, 40)
        .padding(.trailing, 35)
    }
}
