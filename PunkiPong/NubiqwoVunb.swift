//
//  NubiqwoVunb.swift
//  PunkiPong
//
//  Created by Nicolae Chivriga on 19/02/2025.
//

import SwiftUI


struct NubiqwoVunb: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        self.button()
    }
    
    
    func button() -> some View {
        Button {
            self.dismiss()
        } label: {
            Image("uiqsoapnq")
                .resizable()
                .frame(width: 36, height: 32)
        }
    }
}
