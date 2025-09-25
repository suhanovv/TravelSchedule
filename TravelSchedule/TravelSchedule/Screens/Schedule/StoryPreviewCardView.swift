//
//  StoryPreviewCardView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 20.09.2025.
//

import SwiftUI

struct StoryPreviewCardView: View {
    private let cornerRadius: CGFloat = 16
    let card: Story
    let isStoryWatched: Bool
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(card.imagePriview)
                .resizable()
                .frame(width: 92, height: 140)
                .clipShape(.rect(cornerRadius: cornerRadius))
                .opacity(isStoryWatched ? 0.5 : 1)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.ypBlue, lineWidth: isStoryWatched ? 0 : 4 )
                )
            Text(card.title)
                .modifier(RegularTwelve())
                .frame(width: 76, alignment: .leading)
                .lineLimit(3)
                .foregroundStyle(Color.ypWhiteUniversal)
                .padding(.horizontal, 8)
                .padding(.bottom, 12)
        }
    }
}
