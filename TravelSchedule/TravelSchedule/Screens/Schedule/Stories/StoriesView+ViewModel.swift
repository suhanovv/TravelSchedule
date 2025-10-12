//
//  StoriesView+ViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 05.10.2025.
//

import SwiftUI

extension StoriesView {
    @Observable @MainActor
    final class ViewModel {
        let stories: [Story]
        var currentStoryIndex: Int
        var storyDidOpen: (Int) -> Void
        var isLastStory: Bool {
            currentStoryIndex == stories.count - 1
        }
        
        init(stories: [Story], currentStoryIndex: Int, storyDidOpen: @escaping (Int) -> Void) {
            self.stories = stories
            self.currentStoryIndex = currentStoryIndex
            self.storyDidOpen = storyDidOpen
        }
        
        func runNextStory() {
            currentStoryIndex = min(currentStoryIndex + 1, stories.count - 1)
        }
    }
}
