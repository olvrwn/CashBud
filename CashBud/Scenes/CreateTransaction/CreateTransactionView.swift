//
//  CreateTransactionView.swift
//  CashBud
//
//  Created by Oliver Dieke on 06.08.23.
//

import SwiftUI

struct CreateTransactionView: View {
    
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Private Properties
    
    @StateObject
    private var viewModel = CreateTransactionViewModel()
    
    var body: some View {
        
        VStack(spacing: 32) {
            
            self.typeRow
            self.titleRow
            self.categoryRow
            self.recurrenceRow
            self.costsRow
            self.addButton
            
            Spacer()
        }
        .padding()
        .overlay {
            ErrorOverlay(errorOccured: self.$viewModel.errorOccured)
        }
    }
}

// MARK: - Views

extension CreateTransactionView {
    
    private var typeRow: some View {
        
        Picker("Transaction type", selection: self.$viewModel.transaction.type) {
            ForEach(TransactionType.allCases, id: \.self) { type in
                Text(type.rawValue).tag(type as TransactionType?)
            }
        }
        .pickerStyle(.segmented)
    }
    
    private var titleRow: some View {
        
        TextField("Give it a name", text: self.$viewModel.transaction.title)
            .font(.title)
            .textFieldStyle(.roundedBorder)
    }
    
    private var categoryRow: some View {
        
        HStack {
            
            Text("Transaction category")
            Spacer()
            Picker("Transaction category", selection: self.$viewModel.transaction.category) {
                
                ForEach(TransactionCategory.allCases, id: \.self) { category in
                    
                    HStack {
                        
                        Image(systemName: self.viewModel.getIconString(for: category))
                        Text(" \(category.rawValue)")
                    }
                    .tag(category as TransactionCategory?)
                }
            }
            .pickerStyle(.menu)
            
        }
    }
    
    private var recurrenceRow: some View {
        
        HStack {
            
            Text("Recurrence")
            Spacer()
            Picker("Recurrence", selection: self.$viewModel.transaction.recurrence) {
                
                ForEach(TransactionRecurrence.allCases, id: \.self) { period in
                    Text(period.rawValue).tag(period as TransactionRecurrence?)
                }
            }
        }
    }
    
    private var costsRow: some View {
        
        HStack {
            
            Text("Costs per period")
            Spacer()
            TextField("Costs", value: self.$viewModel.transaction.costs, format: .number)
                .frame(width: 150)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
        }
    }
    
    private var addButton: some View {
        
        var requirementsFullfilled: Bool {
            self.viewModel.transaction.type != nil && self.viewModel.transaction.category != nil && self.viewModel.transaction.recurrence != nil && self.viewModel.transaction.costs != nil
        }
        
        return Button {
            
            self.viewModel.addNewTransaction(transaction: self.viewModel.transaction)
            self.dismiss()
        } label: {
            Text("Add transaction")
        }
        .disabled(!requirementsFullfilled)
        .buttonStyle(CBButton(buttonColor: requirementsFullfilled ? .green : .secondary))
    }
}

#Preview {
    CreateTransactionView()
}
