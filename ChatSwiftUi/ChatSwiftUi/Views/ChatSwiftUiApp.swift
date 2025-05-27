//
//  ChatSwiftUiApp.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAppCheck

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct ChatSwiftUiApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var loginViewModel = LoginViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                SplashScreen(loginViewModel: loginViewModel)
            }
        }
    }
}
