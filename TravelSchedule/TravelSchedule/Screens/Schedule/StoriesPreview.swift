//
//  StoriesPreview.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 20.09.2025.
//

import SwiftUI

struct StoriesPreview: View {
    @State private var viewModel: ViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 12) {
                ForEach(Array(viewModel.cards.enumerated()), id: \.element.id) { index, story in
                    StoryPreviewCardView(
                        card: story,
                        isStoryWatched: viewModel.isStoryWatched(story)
                    )
                    .onTapGesture {
                        viewModel.currentCard = story
                    }
                }
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 2)
        }
        .fullScreenCover(item: $viewModel.currentCard, onDismiss: { viewModel.currentCard = nil }) { card in
            StoriesView(
                stories: viewModel.cards,
                currentStory: card,
                storyDidOpen: { storyId in
                    viewModel.addWatchedCard(storyId)
                }
            )
        }
        .frame(height: 188)
        .scrollIndicators(.hidden)
    }
}

extension StoriesPreview {
    init(cards: [Story]) {
        viewModel = ViewModel(cards: cards)
    }
    
    @Observable final class ViewModel {
        let cards: [Story]
        var isStoryActive: Bool = false
        var currentStoryIndex: Int = 0
        var currentCard: Story?
        private(set) var watchedCards: Set<Int> = []
        
        init(cards: [Story]) {
            self.cards = cards
        }
        
        func addWatchedCard(_ id: Int) {
            watchedCards.insert(id)
        }
        
        func isStoryWatched(_ card: Story) -> Bool {
            watchedCards.contains(card.id)
        }
    }
}

#Preview {
    StoriesPreview(cards: Story.stabStories)
}

