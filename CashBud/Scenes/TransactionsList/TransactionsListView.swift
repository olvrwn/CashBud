//
//  TransactionsListView.swift
//  CashBud
//
//  Created by Oliver Dieke on 31.07.23.
//

import SwiftUI

enum TransactionsListScreenType {
    
    case expenses
    case revenue
    case sum
}

struct TransactionsListView: View {
    
    // MARK: - Private Properties
    
    @ObservedObject
    private var viewModel: TransactionsListViewModel
    
    // MARK: - Init
    
    init(transactionsListScreenType: TransactionsListScreenType) {
        self.viewModel = TransactionsListViewModel(transactionsListScreenType: transactionsListScreenType)
    }
    
    var body: some View {
        
        VStack {
            
            if self.viewModel.transactions != [] {
                
                self.list
                    .toolbar {
                        EditButton()
                    }
            } else {
                Text("No transactions")
            }
        }
        .onAppear {
            
            self.viewModel.getTransactions()
            self.viewModel.sortTransactions()
        }
        .overlay {
            ErrorOverlay(errorOccured: self.$viewModel.errorOccured)
        }
        .navigationTitle(self.viewModel.transactionsListScreenTitle)
    }
}

// MARK: - Views

extension TransactionsListView {
    
    private var list: some View {
        
        List {
            
            ForEach(self.viewModel.transactions, id: \.self) { transaction in
                
                HStack {
                    
                    Image(systemName: self.viewModel.getIconString(for: transaction.category))
                    Text(transaction.title)
                    Spacer()
                    
                    VStack {
                        
                        Text("\(self.viewModel.calculateCostsPerMonth(for: transaction), specifier: "%.2f")\(Locale.current.currencySymbol ?? "")")
                        
                        Text("\(transaction.costs, specifier: "%.2f")\(Locale.current.currencySymbol ?? "")/\(self.viewModel.makeRecurrenceDescription(recurrence: transaction.recurrence))")
                            .foregroundStyle(.secondary)
                            .font(.caption)
                    }
                }
            }
            .onDelete { indexSet in
                
                self.viewModel.deleteTransactionAndUpdate(at: indexSet)
                self.viewModel.sortTransactions()
            }
        }
    }
}

#Preview {
    TransactionsListView(transactionsListScreenType: .sum)
}
