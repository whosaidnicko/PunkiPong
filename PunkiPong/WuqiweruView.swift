//
//  WuqiweruView.swift
//  PunkiPong
//
//  Created by Nicolae Chivriga on 19/02/2025.
//

import SwiftUI

struct WuqiweruView: View {
    @State var matiqwq: Bool = false
    var body: some View {
        ZStack {
            Image("bgeiqlsp")
                .resizable()
                .ignoresSafeArea()
            
            Image("wueyqunbkborke")
                .mask {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * (matiqwq ? 1 : 0))
                }
                .onAppear() {
                    withAnimation(Animation.easeInOut(duration: 2)) {
                        matiqwq = true
                    }
                }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: NubiqwoVunb())
    }
}
