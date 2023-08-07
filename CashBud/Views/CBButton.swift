//
//  CBButton.swift
//  CashBud
//
//  Created by Oliver Dieke on 07.08.23.
//

import SwiftUI

struct CBButton: ButtonStyle {
    
    var buttonColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(self.buttonColor)
            .clipShape(Capsule())
    }
}
