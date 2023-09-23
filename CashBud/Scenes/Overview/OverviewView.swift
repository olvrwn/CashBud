//
//  OverviewView.swift
//  CashBud
//
//  Created by Oliver Dieke on 26.07.23.
//

import SwiftUI

struct OverviewView: View {
    
    // MARK: - Private Properties
    
    @ObservedObject
    private var viewModel = OverviewViewModel()
    
    @State
    private var isSheetShown = false
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            VStack {
                
                self.revenue
                self.expenses
                self.divider
                self.sum
                self.divider
                self.divider
            }
            .padding(50)
            
            Spacer()
            
            HStack {
                
                self.addTransactionButton
                self.chartsButton
            }
            .padding(.horizontal)
        }
        .onAppear {
            self.viewModel.calculateValues()
            print("OverviewView appeared")
        }
        .sheet(isPresented: self.$isSheetShown) {
            
            CreateTransactionView()
                .onDisappear {
                    self.viewModel.calculateValues()
                }
        }
        .overlay {
            ErrorOverlay(errorOccured: self.$viewModel.errorOccured)
        }
    }
    
    // MARK: - Views
    
    private var revenue: some View {
        
        NavigationLink {
            TransactionsListView(transactionsListScreenType: .revenue)
        } label: {
            self.makeRow(title: self.viewModel.revenueTitle, value: self.viewModel.revenue)
        }
    }
    
    private var expenses: some View {
        
        NavigationLink {
            TransactionsListView(transactionsListScreenType: .expenses)
        } label: {
            self.makeRow(title: self.viewModel.expensesTitle, value: self.viewModel.expenses)
        }
    }
    
    private var sum: some View {
        
        NavigationLink {
            TransactionsListView(transactionsListScreenType: .sum)
        } label: {
            self.makeRow(title: self.viewModel.sumTitle, value: self.viewModel.sum)
        }
    }
    
    private var divider: some View {
        Divider()
            .frame(height: 2)
            .overlay(.secondary)
    }
    
    private var addTransactionButton: some View {
        
        Button {
            self.isSheetShown.toggle()
        } label: {
            Image(systemName: "plus")
        }
        .buttonStyle(CBButton(buttonColor: .green))
    }
    
    private var chartsButton: some View {
        
        NavigationLink {
            ChartView()
        } label: {
            Image(systemName: "chart.pie")
        }
        .buttonStyle(CBButton(buttonColor: .yellow))
    }
}
    
// MARK: - ViewBuilder

extension OverviewView {
    
    @ViewBuilder
    private func makeRow(title: String, value: Double) -> some View {
        
        HStack {
            
            Text(title)
            Spacer()
            Text("\(value, specifier: "%.2f")")
            Text(Locale.current.currencySymbol ?? "")
        }
        .font(.title2)
        .foregroundColor(.primary)
        .padding()
        .background {
            
            Capsule()
                .fill(.gray)
                .opacity(0.2)
        }
    }
}

#Preview {
    OverviewView()
}
