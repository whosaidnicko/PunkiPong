//
//  SiquzbiorwqpView.swift
//  PunkiPong
//
//  Created by Nicolae Chivriga on 18/02/2025.
//


import SwiftUI
import Lottie

struct SiquzbiorwqpView: View {
    @State var naviwuohGu: Bool = false
    
    var body: some View {
        ZStack {
             // bg full screen
            Image("bgeiqlsp")
                .resizable()
                .ignoresSafeArea()
            
            NavigationLink("", isActive: $naviwuohGu) {
                SuqysinotpwqvView()
            }
            VStack {
                LottieView(animation: .named("siqozpbirqwe"))
                    .playing(loopMode: .loop)
                    .resizable()
                    .frame(width: 250, height: 250)
                // loading cou
                Weiurqiozpbr()
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                ricibi(style: .rigid)
                naviwuohGu = true
            }
        }
        .asfeasnr()
        
    }
}
import SwiftUI

import SwiftUI

struct Weiurqiozpbr: View {
    let text = "Loading..."
    @State private var animate = false

    var body: some View {
        HStack(spacing: 4) {
            ForEach(Array(text.enumerated()), id: \.offset) { index, letter in
                Text(String(letter))
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.blue)
                    .offset(y: animate ? -10 : 10) // Moves up and down
                    .rotationEffect(Angle.degrees(animate ? Double.random(in: -15...15) : 0)) // Rotates randomly
                    .scaleEffect(animate ? 1.2 : 0.8) // Scales in and out
                    .animation(Animation.easeInOut(duration: 0.6)
                        .repeatForever()
                        .delay(Double(index) * 0.1), value: animate)
            }
        }
        .onAppear {
            animate.toggle()
        }
    }
}


import StoreKit
func requestReview(in window: UIWindow?) {
    if let windowScene = window?.windowScene {
        SKStoreReviewController.requestReview(in: windowScene)
    } else {
        print("Failed to find a valid UIWindowScene.")
    }
}
@preconcurrency import WebKit
import SwiftUI

struct WKWebViewRepresentable: UIViewRepresentable {
    typealias UIViewType = WKWebView

    var url: URL
    var webView: WKWebView
    var onLoadCompletion: (() -> Void)?
    

    init(url: URL, webView: WKWebView = WKWebView(), onLoadCompletion: (() -> Void)? = nil) {
        self.url = url
        self.webView = webView
        self.onLoadCompletion = onLoadCompletion
        self.webView.layer.opacity = 0 // Hide webView until content loads
    }

    func makeUIView(context: Context) -> WKWebView {
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        
        return webView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
        uiView.scrollView.isScrollEnabled = true
        uiView.scrollView.bounces = true
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

// MARK: - Coordinator
extension WKWebViewRepresentable {
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        var parent: WKWebViewRepresentable
        private var popupWebViews: [WKWebView] = []

        init(_ parent: WKWebViewRepresentable) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            // Handle popup windows
            guard navigationAction.targetFrame == nil else {
                return nil
            }

            let popupWebView = WKWebView(frame: .zero, configuration: configuration)
            popupWebView.uiDelegate = self
            popupWebView.navigationDelegate = self

            parent.webView.addSubview(popupWebView)

            popupWebView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                popupWebView.topAnchor.constraint(equalTo: parent.webView.topAnchor),
                popupWebView.bottomAnchor.constraint(equalTo: parent.webView.bottomAnchor),
                popupWebView.leadingAnchor.constraint(equalTo: parent.webView.leadingAnchor),
                popupWebView.trailingAnchor.constraint(equalTo: parent.webView.trailingAnchor)
            ])

            popupWebViews.append(popupWebView)
            return popupWebView
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Notify when the main page finishes loading
            parent.onLoadCompletion?()
            parent.webView.layer.opacity = 1 // Reveal the webView
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }

        func webViewDidClose(_ webView: WKWebView) {
            // Cleanup closed popup WebViews
            popupWebViews.removeAll { $0 == webView }
            webView.removeFromSuperview()
        }
    }
}

struct Swiper: ViewModifier {
    var onDismiss: () -> Void
    @State private var offset: CGSize = .zero

    func body(content: Content) -> some View {
        content
//            .offset(x: offset.width)
            .animation(.interactiveSpring(), value: offset)
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                                      self.offset = value.translation
                                  }
                                  .onEnded { value in
                                      if value.translation.width > 70 {
                                          onDismiss()
                                  
                                      }
                                      self.offset = .zero
                                  }
            )
    }
}



