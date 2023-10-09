//
//  CashBudApp.swift
//  CashBud
//
//  Created by Oliver Dieke on 25.07.23.
//

import SwiftUI
import SwiftData
import HelloWorldView

@main
struct CashBudApp: App {

    var body: some Scene {
        
        WindowGroup {
            
            NavigationStack {
                OverviewView()
                HelloWorldView()
            }
        }
    }
}
