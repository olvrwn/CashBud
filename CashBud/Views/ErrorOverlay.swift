//
//  ErrorOverlay.swift
//  CashBud
//
//  Created by Oliver Dieke on 07.08.23.
//

import SwiftUI

struct ErrorOverlay: View {
    
    @Binding
    var errorOccured: Bool
    
    var body: some View {
        
        if self.errorOccured {
            
            VStack {
                
                Spacer()
                Text("An Error Occured")
                    .foregroundStyle(.primary)
                    .padding(12)
                    .background {
                        Capsule()
                            .fill(.red)
                    }
            }
        }
    }
}
