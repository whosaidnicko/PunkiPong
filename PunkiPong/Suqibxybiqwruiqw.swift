//
//  Suqibxybiqwruiqw.swift
//  PunkiPong
//
//  Created by Nicolae Chivriga on 19/02/2025.
//

import SwiftUI
import Lottie


struct Suqibxybiqwruiqw: View {
    @State var qwertqasubr: Bool = false
    var body: some View {
        // gamie
        ZStack {
            Image("bgeiqlsp")
                .resizable()
                .ignoresSafeArea()
            
            sowqpsig()
            
            WKWebViewRepresentable(url: URL(string: "https://plays.org/game/pong-ball/")!) {
                ricibi(style: .heavy)
                self.qwertqasubr = true
            }
            .scaleEffect(qwertqasubr ? 1 : 0)
            .rotationEffect(.degrees(qwertqasubr ? 360 : 0))
            .animation(Animation.easeInOut, value: qwertqasubr)
            .onTapGesture {
                ricibi(style: .light)
            }
                
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: NubiqwoVunb())
    }
    
    @ViewBuilder
    func sowqpsig() -> some View {
        if !qwertqasubr {
            LottieView(animation: .named("aduiqdvbewsd"))
                .playing(loopMode: .loop)
                .resizable()
                .frame(width: 250, height: 250)
        }
    }
}
extension View {
    func asfeasnr() -> some View {
        self.modifier(Awkoqpslgrqas())
    }
}
