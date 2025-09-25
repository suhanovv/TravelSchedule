//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 20.09.2025.
//

import SwiftUI

struct StoriesView: View {
    @State private var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            ZStack(alignment: .topTrailing) {
                TabView(selection: $viewModel.currentStoryIndex) {
                    ForEach(Array(viewModel.stories.enumerated()), id: \.element.id) { index, story in
                        StoryView(
                            story: story,
                            storyIndex: index,
                            storyDidFinish: didCurrentStoryFinished,
                            storyDidOpen: { storyId in viewModel.storyDidOpen(storyId) },
                            currentStoryIndex: $viewModel.currentStoryIndex,
                        )
                        .tag(index)
                    }
                }
                .ignoresSafeArea()
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                Button("", image: .close) {
                    dismiss()
                }
                .padding(.top, 57)
                .padding(.trailing, 12)
            }
    }
    
    func didCurrentStoryFinished() {
        switch viewModel.isLastStory {
            case true: dismiss()
            case false: withAnimation { viewModel.runNextStory() }
        }
    }
}

extension StoriesView {
    
    init(stories: [Story], currentStory: Story,  storyDidOpen: @escaping (Int) -> Void) {
        viewModel = .init(
            stories: stories,
            currentStoryIndex: stories.firstIndex(of: currentStory) ?? 0,
            storyDidOpen: storyDidOpen
        )
    }
    
    @Observable final class ViewModel {
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

#Preview {
    StoriesView(stories: Story.stabStories, currentStory: Story.oneStory) { _ in }
}
