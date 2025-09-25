//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 20.09.2025.
//

import SwiftUI

struct StoryView: View {
    let story: Story
    let storyIndex: Int
    let storyDidFinish: () -> Void
    let storyDidOpen: (Int) -> Void
    private var timerConfiguration: TimerConfiguration { TimerConfiguration(storiesCount: story.images.count)}
    @Binding var currentStoryIndex: Int
    @State private var currentProgress: CGFloat = 0
    @State private var currentStoryImageIndex: Int = 0
    @State private var isStoryActive: Bool = false
    @State private var isStoryFinished: Bool = false

    var body: some View {
        ZStack {
            Image(story.images[currentStoryImageIndex])
                .resizable()
                .overlay(
                    OverlayTextView(title: story.title, content: story.content)
                )
                .clipShape(.rect(cornerRadius: 40))
                .background(.ypBlackUniversal)
            
            StoriesProgressBar(
                storiesCount: story.images.count,
                timerConfiguration: timerConfiguration,
                currentProgress: $currentProgress,
                isProgressBarActive: $isStoryActive
            )
            .padding(.init(top: 28, leading: 12, bottom: 12, trailing: 12))
            .onChange(of: currentProgress) { _, newValue in
                didChangeCurrentProgress(newProgress: newValue)
            }
        }
        .onTapGesture {
            if currentStoryImageIndex == story.images.count - 1 {
                withAnimation {
                    currentProgress = timerConfiguration.totalProgress
                }
            } else {
                currentStoryImageIndex = min(currentStoryImageIndex + 1, story.images.count - 1)
            }
        }
        .onChange(of: currentStoryImageIndex) { oldValue, newValue in
            didChangeCurrentIndex(oldIndex: oldValue, newIndex: newValue)
        }
        .onChange(of: currentStoryIndex) { oldValue, newValue in
            if oldValue == storyIndex {
                isStoryActive = false
            } else if newValue == storyIndex {
                storyDidOpen(story.id)
                isStoryActive = true
            }
        }
        .onChange(of: isStoryFinished) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                storyDidFinish()
            }
        }
        .onAppear {
            if currentStoryIndex == storyIndex {
                storyDidOpen(story.id)
                isStoryActive = true
            }
        }
    }
    
    private func didChangeCurrentIndex(oldIndex: Int, newIndex: Int) {
        guard oldIndex != newIndex else { return }
        let progress = timerConfiguration.progress(for: newIndex)
        guard abs(progress - currentProgress) >= 0.01 else { return }
        
        withAnimation {
            currentProgress = progress
        }
    }
    
    private func didChangeCurrentProgress(newProgress: CGFloat) {
        if timerConfiguration.isFinished(progress: newProgress) {
            isStoryFinished = true
        } else {
            let index = timerConfiguration.index(for: newProgress)
            guard index != currentStoryImageIndex else { return }
            
            withAnimation {
                currentStoryImageIndex = index
            }
        }
    }
}

fileprivate struct OverlayTextView: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .modifier(BoldThirtyFour())
                    .foregroundColor(.white)
                Text(content)
                    .modifier(RegularTwenty())
                    .lineLimit(3)
                    .foregroundColor(.white)
            }
            .padding(.init(top: 0, leading: 16, bottom: 40, trailing: 16))
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    StoryView(
        story: Story.oneStory,
        storyIndex: 0,
        storyDidFinish: {},
        storyDidOpen: { _ in },
        currentStoryIndex: .constant(0))
}
