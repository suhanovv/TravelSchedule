//
//  ThreadFilterButton.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.09.2025.
//

import SwiftUI

struct ThreadFilterButton: View {
    let isAnyFilterActive: Bool
    
    var body: some View {
        NavigationLink(value: NavigationRoute.filterScreen) {
            HStack(spacing: 4) {
                Text("Уточнить время")
                    .modifier(BoldSeventeen())
                    .foregroundColor(.white)
                Circle()
                    .fill(.ypRed)
                    .frame(width: 8, height: 8)
                    .opacity(isAnyFilterActive ? 1 : 0)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(RoundedRectangle(cornerRadius: 16)
            .fill(.ypBlue))
        }
        .padding(.bottom, 24)
    }
}

#Preview {
    ThreadFilterButton(isAnyFilterActive: false)
}
