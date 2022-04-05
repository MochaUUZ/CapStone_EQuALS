//
//  HistoryPage.swift
//  forMilestone4
//
//  Created by Sheng hao Dong on 3/8/22.
//  Filled by Jiaqi Yang on 4/4/22

import SwiftUI

struct HistoryPage: View {
    var body: some View {
        VStack {
            Text("Exam History")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundColor(Color.LoginBlue)
            Divider()
                .frame(height: 2)
                .background(Color.LoginBlue)
            ExamHistoryPart0()
        }
        
    }
}



struct ExamHistoryPart0:View{
    var body:some View{
        List(examHistorys) { examHistory in
    
            VStack(alignment: .leading){
                
                Text(examHistory.companyName)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding(.leading,20)
                Divider()
                    .frame(height: 2)
                    .background(Color.LoginBlue)
                    .padding(.horizontal, 30)
                //start time
                HStack{
                    Text("Start time:")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .frame(width: 100, height: 30, alignment: .leading)
                        .padding(.leading,20)
                    Text(examHistory.startDate)
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .frame(width: 170, height: 30, alignment: .trailing)
                        .padding(.trailing,20)
                }
                //score
                HStack{
                    Text("Score:")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .frame(width: 120, height: 30, alignment: .leading)
                        .padding(.leading,20)
                    Text(examHistory.score)
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .frame(width: 150, height: 30, alignment: .trailing)
                        .padding(.trailing,20)
                        
                }
                //incomplete
                HStack{
                    Text("Incomplete")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .frame(width: 120, height: 30, alignment: .leading)
                        .padding(.leading,20)
                    Text(examHistory.incomplete)
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .frame(width: 150, height: 30, alignment: .trailing)
                        .padding(.trailing,20)
        
                }
                HStack{
                    Text("")
                        .frame(width: 160, height: 30, alignment: .leading)
                        
                        
                    Button(action: {}) {
                        ReviewButtonContent()}
                }
                
                
            }.padding(.bottom, 10)
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.backgroundBlue)
                .cornerRadius(15.0)
             
        }
    }
    
}
struct ReviewButtonContent: View {
    var body: some View {
        Text("Review")
            .font(.system(size: 20))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 100, height: 30, alignment: .trailing)
            .padding(.trailing,30)
            .background(Color.LoginBlue)
            .cornerRadius(10.0)
            .padding(.top,20)
    }
}

struct HistoryPage_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPage()
        
    }
}

