//
//  ChartView.swift
//  CashBud
//
//  Created by Oliver Dieke on 01.08.23.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    // MARK: - Private Properties
    
    @ObservedObject
    private var viewModel: ChartViewModel
    
    // MARK: - Init
    
    init(viewModel: ChartViewModel = ChartViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            self.revenueChart
            Spacer()
                .frame(height: 50)
            self.expensesChart
            Spacer()
                .frame(height: 50)
            self.chartCaption
            Spacer()
        }
        .padding()
        .onAppear {
            self.viewModel.fetchAndDivideTransactions()
        }
        .overlay {
            ErrorOverlay(errorOccured: self.$viewModel.errorOccured)
        }
    }
}
    
// MARK: - Views

extension ChartView {
    
    private var revenueChart: some View {
        
        VStack {
            
            Text("Revenues")
                .font(.title)
                .bold()
            
            if self.viewModel.revenueData.isEmpty {
                Text("No data available")
            } else {
                self.makeDonutChart(data: self.viewModel.revenueData)
            }
        }
    }
    
    private var expensesChart: some View {
        
        VStack {
            
            Text("Expenses")
                .font(.title)
                .bold()
            
            if self.viewModel.expensesData.isEmpty {
                Text("No data available")
            } else {
                self.makeDonutChart(data: self.viewModel.expensesData)
            }
        }
    }
    
    private var chartCaption: some View {
        
        VStack {
            
            if self.viewModel.revenueSum > 0 {
                
                Text("On average, you're spending \(self.viewModel.expensesSum / self.viewModel.revenueSum * 100, specifier: "%.0f")% of your monthly income.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .greatestFiniteMagnitude, alignment: .center)
            }
        }
    }
}
    
// MARK: - ViewBuilder

extension ChartView {
    
    @ViewBuilder
    func makeDonutChart(data: [Transaction]) -> some View {
        
        Chart(data, id: \.id) { transaction in
            
            SectorMark(
                angle: .value(
                    "Transactions",
                    self.viewModel.calculateMonthlyCosts(transaction: transaction)),
                innerRadius: .ratio(0.618),
                angularInset: 1.5
            )
            .cornerRadius(5)
            .foregroundStyle(by: .value("Name", transaction.category))
        }
        .frame(height: 200)
    }
}

#Preview {
    ChartView()
}
