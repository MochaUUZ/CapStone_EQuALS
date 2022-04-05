//
//  JoinSessionPage.swift
//  forMilestone4
//
//  Created by Jiaqi Yang on 4/5/22.
//

import SwiftUI

struct JoinSessionPage: View {
    var body: some View {
        VStack(alignment: .leading) {
            returnToHomePage().padding(.trailing)
            JoinSessionInput()
            Button(action: {}) {
                JoinSessionButtonContent()}
            .padding(.bottom,150)
        }.padding()
        
    }
}

struct JoinSessionPage_Previews: PreviewProvider {
    static var previews: some View {
        JoinSessionPage()
    }
}


struct returnToHomePage:View{
    var body: some View {
        Button(action: {
        }){
            Image("return")
                .renderingMode(.original)
                .padding()
        }
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 1))
        .padding(.bottom,100)
    }
}

struct JoinSessionButtonContent:View{
    var body: some View {
        
        Text("Join Polling Session")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.LoginBlue)
            .cornerRadius(15.0)
            
        
    }
}



struct JoinSessionInput: View {
    @State var JS_username: String = ""
    @State var JS_sessionID: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Name")
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.horizontal, 30).padding(.top, 20)
            TextField("", text: $JS_username)
                .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical, 20)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
                .cornerRadius(5)
          
            
            Text("Session ID")
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.horizontal, 30).padding(.top, 20)
            
            SecureField("", text: $JS_sessionID)
                .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical, 20)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
                .cornerRadius(5)
                
          

            
        }.padding(.bottom,80)
    }
}
