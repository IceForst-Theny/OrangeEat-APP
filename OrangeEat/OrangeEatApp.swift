//
//  OrangeEatApp.swift
//  OrangeEat
//
//  Created by 蔡宇轩 on 4/23/23.
//

import SwiftUI
import Firebase

@main
struct OrangeEatApp: App {

//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    init(){
        FirebaseApp.configure()
        }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()

        }
    }
}
//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        FirebaseApp.configure()
//        return true
//    }
//}
