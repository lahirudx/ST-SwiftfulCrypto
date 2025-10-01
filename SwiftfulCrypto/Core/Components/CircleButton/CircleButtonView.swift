//
//  CircleButtonView.swift
//  SwiftfulCrypto
//
//  Created by Lahiru Amarasooriya on 2025-09-29.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(.scAccent)
            .frame(width: 50, height: 50)
            .background(Circle().foregroundStyle(.scBackground))
            .shadow(color: .scAccent.opacity(0.25), radius: 10)
            .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        CircleButtonView(iconName: "info")
        
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        CircleButtonView(iconName: "info")
            .preferredColorScheme(.dark)
        
        
    }
}
