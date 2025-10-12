//
//  StoriesPreview+ViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 05.10.2025.
//

import SwiftUI

extension StoriesPreview {
    @Observable @MainActor
    final class ViewModel {
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
