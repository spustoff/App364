//
//  App364App.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import OneSignalFramework
import YandexMobileMetrica

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        Apphud.start(apiKey: DataManager().appHudID)
        
        OneSignal.initialize(DataManager().oneSignalID, withLaunchOptions: launchOptions)
        YMMYandexMetrica.activate(with: YMMYandexMetricaConfiguration.init(apiKey: DataManager().metricaID)!)
        
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App364App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView {
                
                ContentView()
            }
        }
    }
}
