
// for the list of the exam historys
// the UI is in the page of HistoryPage

import SwiftUI
import Foundation

struct examHistoryEach:Identifiable{
    let id=UUID()
    var companyName:String
    var startDate:String
    var score:String
    var incomplete:String
    
}
    //list of exam historys
let examHistorys=[
    examHistoryEach(companyName: "LABSG(4,400+ Questions)", startDate: "2021-03-28 12:05", score: "98%", incomplete: "1"),
    examHistoryEach(companyName: "Structville - Concrete Technology Quiz", startDate: "2021-03-24 16:37", score: "75%", incomplete: "2"),
    examHistoryEach(companyName: "Structville - Concrete Technology Quiz", startDate: "2021-02-27 09:12", score:"50%", incomplete: "4")
    
]
