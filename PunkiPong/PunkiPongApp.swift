//
//  PunkiPongApp.swift
//  PunkiPong
//
//  Created by Nicolae Chivriga on 18/02/2025.
//

import SwiftUI

@main
struct PunkiPongApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SiquzbiorwqpView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.kisquzmbotw
    }
    
    static var kisquzmbotw = UIInterfaceOrientationMask.portrait {
        didSet {
            if #available(iOS 16.0, *) {
                UIApplication.shared.connectedScenes.forEach { scene in
                    if let windowScene = scene as? UIWindowScene {
                        windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: kisquzmbotw))
                    }
                }
                UIViewController.attemptRotationToDeviceOrientation()
            } else {
                if kisquzmbotw == .landscape {
                    UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
                } else {
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                }
            }
        }
    }
}

func ricibi(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    let ofqlr = UIImpactFeedbackGenerator(style: style)
    ofqlr.impactOccurred()
    
}
