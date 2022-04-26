//
//  setting-updateEmailAddress.swift
//  Capstone_EQuALS
//
//  Created by Jiaqi Yang on 4/25/22.
//

import SwiftUI

struct setting_updateEmailAddress: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    showEmailAddress()
                        .padding(.vertical, 20)
                    changeEmailAddress()
                    
                    Button(action: {
                        //confirm UpdateEmailContent
                    }){
                        confirmUpdateEmailContent()
                    }
                    
                    Button(action: {
                        //return to setting page
                    }){
                        cancelUpdateEmailContent()
                    }
                }.padding()
            }.navigationTitle("Update Password")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct setting_updateEmailAddress_Previews: PreviewProvider {
    static var previews: some View {
        setting_updateEmailAddress()
    }
}

struct showEmailAddress:View{
    var body: some View{
        Text("Email Address: ")
            .font(.body)
       + Text("abcd@g.com")
            .font(.body)
            .foregroundColor(.LoginBlue)

    }
}

struct changeEmailAddress:View{
    @State var newEmailAddress: String = ""
    @State var confirmEmailAddress: String = ""
    var body: some View{
        
            Text("New Email Address").font(.body)
            TextField("",text: self.$newEmailAddress)
                .padding(.vertical, 20)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
                .cornerRadius(5)
            Text("Confirm Email Address").font(.body)
            TextField("",text: self.$confirmEmailAddress)
                .padding(.vertical, 20)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.96))
                .cornerRadius(5)
    }
}

struct confirmUpdateEmailContent:View{
    var body: some View{
        Text("Confirm")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.LoginBlue)
            .cornerRadius(15.0)
    }
}


struct cancelUpdateEmailContent:View{
    var body: some View{
        Text("Cancel")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.LoginBlue)
            .cornerRadius(15.0)
    }
}
