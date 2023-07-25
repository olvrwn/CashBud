//
//  CashBudApp.swift
//  CashBud
//
//  Created by Oliver Dieke on 25.07.23.
//

import SwiftUI
import SwiftData

@main
struct CashBudApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
