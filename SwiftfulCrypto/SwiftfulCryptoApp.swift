//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Lahiru Amarasooriya on 2025-09-28.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    
    @StateObject private var vm: HomeViewModel = .init()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
