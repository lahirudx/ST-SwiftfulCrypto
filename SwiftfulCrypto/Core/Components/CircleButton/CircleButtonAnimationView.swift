//
//  CircleButtonAnimationView.swift
//  SwiftfulCrypto
//
//  Created by Lahiru Amarasooriya on 2025-09-29.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1 : 0)
            .opacity(animate ? 0 : 1)
            .animation(animate ? .easeOut(duration: 1) : .none, value: animate)
            .onAppear {
            animate.toggle()
        }
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .foregroundStyle(.scRed)
        .frame(width: 100, height: 100)
}
