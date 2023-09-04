//
//  DummyData.swift
//  CashBud
//
//  Created by Oliver Dieke on 02.09.23.
//

import Foundation

enum DummyData {
    
    enum Transaction {
        
        static let revenue1 = CashBud.Transaction(
            id: UUID(uuidString: "5238c559-dd1d-4733-8ed8-2e9f8a63b5fa")!,
            type: .revenue,
            category: .work,
            recurrence: .monthly,
            title: "Income",
            costs: 1000
        )
        
        static let revenue2 = CashBud.Transaction(
            id: UUID(uuidString: "6397d843-fae2-41c4-b8e7-139a697dfec0")!,
            type: .revenue,
            category: .saveUp,
            recurrence: .quarterly,
            title: "Dividends",
            costs: 50
        )
        
        static let expense1 = CashBud.Transaction(
            id: UUID(uuidString: "2900d593-c1e2-49aa-ba05-24b923adcfad")!,
            type: .expense,
            category: .credit,
            recurrence: .yearly,
            title: "Credit",
            costs: 1000
        )
        
        static let expense2 = CashBud.Transaction(
            id: UUID(uuidString: "dac7f71a-23b0-4b1d-bd84-a2ba7014b05c")!,
            type: .expense,
            category: .entertainment,
            recurrence: .monthly,
            title: "Apple Music",
            costs: 10.99
        )
        
        static let expense3 = CashBud.Transaction(
            id: UUID(uuidString: "8d64c62f-7e98-4233-9bf3-14a2ae796c4e")!,
            type: .expense,
            category: .entertainment,
            recurrence: .monthly,
            title: "Apple TV+",
            costs: 6.99
        )
        
        static let revnues = [ // rename to revenuesUnsorted ?
            
            DummyData.Transaction.revenue1,
            DummyData.Transaction.revenue2
        ]
        
        static let revenuesSorted = [
            
            DummyData.Transaction.revenue2,
            DummyData.Transaction.revenue1
        ]
        
        static let expenses = [ // rename to expensesUnsorted ?
            
            DummyData.Transaction.expense2,
            DummyData.Transaction.expense1,
            DummyData.Transaction.expense3
        ]
        
        static let expensesSorted = [
        
            DummyData.Transaction.expense1,
            DummyData.Transaction.expense2,
            DummyData.Transaction.expense3
        ]
        
        static let arrayUnsorted = [
            
            DummyData.Transaction.expense2,
            DummyData.Transaction.revenue1,
            DummyData.Transaction.expense3,
            DummyData.Transaction.expense1,
            DummyData.Transaction.revenue2,
        ]
        
        static let arraySorted = [
            
            DummyData.Transaction.revenue1,
            DummyData.Transaction.revenue2,
            DummyData.Transaction.expense1,
            DummyData.Transaction.expense2,
            DummyData.Transaction.expense3
        ]
    }
    
    enum TransactionCreationProcessModel {
        
        static let expense = CashBud.TransactionCreationProcessModel(
            type: .expense,
            category: .mobility,
            recurrence: .monthly,
            title: "D-Ticket",
            costs: 49
        )
    }
}
