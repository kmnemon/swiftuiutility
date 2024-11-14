//
//  ForEachView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/11.
//

import SwiftUI

extension ForEachView {
    struct ExpenseItem{
        let id = UUID()
        let name: String
        let type: String
        let amount: Double
    }
    
    struct ExpenseItemB: Identifiable{
        let id = UUID()
        let name: String
        let type: String
        let amount: Double
    }
    
    @Observable
    class Expenses{
        var items = [ExpenseItem]()
    }
    
    @Observable
    class ExpensesB{
        var items = [ExpenseItemB]()
    }
}
struct ForEachView: View {
    let agents = ["cyril", "lana", "pam", "sterling"]
    
    @State private var expenses = Expenses()
    @State private var expensesB = ExpensesB()
    
    var body: some View {
        VStack{
            HStack{
                ForEach(0..<5){ number in
                    Text("Row \(number)")
                }
            }
            
            HStack{
                ForEach(0..<agents.count){
                    Text(agents[$0])
                }
            }
            
            HStack{  // using id:\.self the swiftUI caculate the object's hash value to compare each other
                ForEach(agents, id:\.self){
                    Text($0)
                }
            }
            HStack{
                ForEach(expenses.items, id: \.id){ item in
                    Text(item.name)
                }
            }
            HStack{
                ForEach(expensesB.items){ item in
                    Text(item.name)
                }
            }
        }
    }
}

#Preview {
    ForEachView()
}
