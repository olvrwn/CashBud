//
//  Item.swift
//  CashBud
//
//  Created by Oliver Dieke on 25.07.23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
