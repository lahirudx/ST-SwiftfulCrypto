//
//  SearchBarView.swift
//  SwiftfulCrypto
//
//  Created by Lahiru Amarasooriya on 2025-10-04.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(searchText.isEmpty ? .scSecondaryText : .scAccent)
            
            TextField("Search by name or symbol", text: $searchText)
                .foregroundStyle(.scAccent)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundStyle(.scAccent)
                        .opacity(searchText.isEmpty ? 0 : 1)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    , alignment: .trailing
                        
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.scBackground)
                .shadow(color: Color.scAccent.opacity(0.15), radius: 10, x: 0, y: 0)
                
        )
        .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        SearchBarView(searchText: .constant(""))
        
    }
}
