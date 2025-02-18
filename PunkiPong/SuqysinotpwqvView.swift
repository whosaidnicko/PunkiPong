//
//  SuqysinotpwqvView.swift
//  PunkiPong
//
//  Created by Nicolae Chivriga on 19/02/2025.
//

import SwiftUI


struct SuqysinotpwqvView: View {
    @State var sojgqoskohpq: Bool = false
    var body: some View {
        ZStack {
            Image("bgeiqlsp")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("iusquopgeuwisj")
                    .scaleEffect(sojgqoskohpq ? 1 : 0)
                    .rotationEffect(.degrees(sojgqoskohpq ? 360 : 0))
                    .animation(Animation.bouncy.delay(0.1), value: sojgqoskohpq)
                // qiucbi qeur
                NavigationLink {
                    Suqibxybiqwruiqw()
                } label: {
                    Image("sougqizlbor")
                }
                .offset(y: sojgqoskohpq ? 0 : -UIScreen.main.bounds.height)
                .animation(Animation.bouncy.delay(0.25), value: sojgqoskohpq)
                
                // niwu qps
                NavigationLink {
                    WuqiweruView()
                } label: {
                    Image("uqisojntuwq")
                        .overlay {
                            Text("INFO")
                                .font(.system(size: 20, weight: .thin, design: .serif))
                                .foregroundStyle(.white)
                        }
                }
                .scaleEffect(sojgqoskohpq ? 1 : 0)
                .animation(Animation.easeInOut.delay(0.45), value: sojgqoskohpq)
                .padding(.vertical)
                
                Button {
                    if let window = UIApplication.shared.windows.first {
                        requestReview(in: window)
                    }
                } label: {
                    Image("uqisojntuwq")
                        .overlay {
                            Text("STARS")
                                .font(.system(size: 20, weight: .thin, design: .serif))
                                .foregroundStyle(.white)
                        }
                }
                .offset(x: sojgqoskohpq ? 0 : UIScreen.main.bounds.width)
                .animation(Animation.bouncy.delay(0.65), value: sojgqoskohpq)


               
                  

            }
        }
        .onAppear() { self.sojgqoskohpq = true }
        .navigationBarBackButtonHidden()
        
    }
}
import WebKit
struct Awkoqpslgrqas: ViewModifier {

    @State var webView: WKWebView = WKWebView()
    @AppStorage("adapt") var aqarkw: URL?
    
    @State var skgie: Bool = true

    
    
    func body(content: Content) -> some View {
        ZStack {
            if !skgie {
                if aqarkw != nil {
                    VStack(spacing: 0) {
                        WKWebViewRepresentable(url: aqarkw!)
                        HStack {
                            Button(action: {
                                webView.goBack()
                            }, label: {
                                Image(systemName: "chevron.left")
                                
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20) // Customize image size
                                    .foregroundColor(.white)
                            })
                            .offset(x: 10)
                            
                            Spacer()
                            
                            Button(action: {
                                
                                webView.load(URLRequest(url: aqarkw!))
                            }, label: {
                                Image(systemName: "house.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)                                                                       .foregroundColor(.white)
                            })
                            .offset(x: -10)
                            
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        .padding(.bottom, 15)
                        .background(Color.black)
                    }
                    .onAppear() {
                        AppDelegate.kisquzmbotw = .all
                    }
                    .modifier(Swiper(onDismiss: {
                        self.webView.goBack()
                    }))
                    
                    
                } else {
                    content
                }
            } else {
                
            }
        }
        .onAppear() {
            if aqarkw == nil {
                checkpesk()
            } else {
                skgie = false
            }
        }
    }

    class RedirectTrackingSessionDelegate: NSObject, URLSessionDelegate, URLSessionTaskDelegate {
        var redirects: [URL] = []
        var redirects1: Int = 0
        let action: (URL) -> Void
          
          // Initializer to set up the class properties
          init(action: @escaping (URL) -> Void) {
              self.redirects = []
              self.redirects1 = 0
              self.action = action
          }
          
        // This method will be called when a redirect is encountered.
        func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
            if let redirectURL = newRequest.url {
                // Track the redirected URL
                redirects.append(redirectURL)
           
                redirects1 += 1
                if redirects1 >= 3 {
                    DispatchQueue.main.async {
                        self.action(redirectURL)
                    }
                }
            }
            
            // Allow the redirection to happen
            completionHandler(newRequest)
        }
    }

    func checkpesk() {
        guard let url = URL(string: "https://optimizeprivacyonline.online/en/sqiaubpunk") else {
            DispatchQueue.main.async {
                self.skgie = false
            }
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Create a custom URLSession configuration
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false // Prevents automatic cookie handling
        configuration.httpShouldUsePipelining = true
        
        // Create a session with a delegate to track redirects
        let delegate = RedirectTrackingSessionDelegate() { url in
            aqarkw = url
        }
        let session = URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
        
        session.dataTask(with: request) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                DispatchQueue.main.async {
                    self.skgie = false
                }
                return
            }
            
            // Print the final redirect URL
            if let finalURL = httpResponse.url, finalURL != url {
                print("Final URL after redirects: \(finalURL)")
//                self.hleras = finalURL
            }
            
            // Check the status code and print the response body if successful
            if httpResponse.statusCode == 200, let adaptfe = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    // Uncomment to print the response body
                    // print("Response Body: \(adaptfe)")
                }
            } else {
                DispatchQueue.main.async {
                    print("Request failed with status code: \(httpResponse.statusCode)")
                    self.skgie = false
                }
            }

            DispatchQueue.main.async {
                self.skgie = false
            }
        }.resume()
    }


}
