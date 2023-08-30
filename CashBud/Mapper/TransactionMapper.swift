//
//  TransactionMapper.swift
//  CashBud
//
//  Created by Oliver Dieke on 30.08.23.
//

import Foundation

enum TransactionMapperError: Error {
    case missingParameter
}

struct TransactionMapper {
    
    func map(_ transactionCreationProcessModel: TransactionCreationProcessModel) throws -> Transaction {
        
        guard
            let type = transactionCreationProcessModel.type,
            let category = transactionCreationProcessModel.category,
            let recurrence = transactionCreationProcessModel.recurrence,
            let costs = transactionCreationProcessModel.costs
        else {
            throw TransactionMapperError.missingParameter
        }
        
        return Transaction(
            id: transactionCreationProcessModel.id,
            type: type,
            category: category,
            recurrence: recurrence,
            title: transactionCreationProcessModel.title,
            costs: type == .expense ? -costs : costs
        )
    }
}
