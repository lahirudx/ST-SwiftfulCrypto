//
//  ContentView.swift
//  SwiftfulCrypto
//
//  Created by Lahiru Amarasooriya on 2025-09-28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.scBackground
                .ignoresSafeArea()
            
            VStack {
                Text("Accent Color")
                    .foregroundStyle(.scAccent)
                
                Text("Secondary Text Color")
                    .foregroundStyle(.scSecondaryText)
                
                Text("Red Color")
                    .foregroundStyle(.scRed)
                
                Text("Red Color")
                    .foregroundStyle(.scGreen)
            }
        }
    }
}

#Preview {
    ContentView()
}
