//
//  setting-updateUserName.swift
//  Capstone_EQuALS
//
//  Created by Jiaqi Yang on 4/25/22.
//

import SwiftUI

struct setting_updateUserName: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    showUserName().padding(.vertical, 20)
                    
                    updateUserName()
                    Button(action: {
                        //confirm changing username
                    }){
                        confirmUpdateUserNameContent()
                    }
                    /*
                    Button(action: {
                        //return to setting page
                    }){
                        CancelUpdateUserNameContent()
                    }
                     */
                }.padding()
            }.navigationTitle("Update UserName")
                
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct setting_updateUserName_Previews: PreviewProvider {
    static var previews: some View {
        setting_updateUserName()
    }
}

struct showUserName:View{
    var body: some View{
        Text("UserName: ")
            .font(.body)
            .foregroundColor(Color.blue1)
       + Text("User456")
            .font(.body)
            .foregroundColor(Color.blueLink1)

    }
}
struct updateUserName:View{
    @State private var newUsername1: String = ""
    @State private var confirmNewUsername1: String = ""
    var body: some View{
        
    
        Text("New Username").font(.body).foregroundColor(Color.blue1)
        TextField("",text: self.$newUsername1)
            .padding(.vertical, 20)
            .background(Color.grayLight1)
            .cornerRadius(5)
        Text("Confirm New Username").font(.body)
            .foregroundColor(Color.blue1)
        TextField("",text: self.$confirmNewUsername1)
            .padding(.vertical, 20)
            .background(Color.grayLight1)
            .cornerRadius(5)
    }
}
struct confirmUpdateUserNameContent: View {
    var body: some View {
        
        Text("Confirm")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.green1)
            .cornerRadius(15.0)
    }
}
struct CancelUpdateUserNameContent: View {
    var body: some View {
        Text("Cancel")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.green1)
            .cornerRadius(15.0)
    }
}
