//
//  TimerConfiguration.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 20.09.2025.
//

import Foundation

struct TimerConfiguration {
    let storiesCount: Int
    let timerTickInternal: TimeInterval
    let progressPerTick: CGFloat
    let totalProgress: CGFloat = 1

    init(
        storiesCount: Int,
        secondsPerStory: TimeInterval = 5,
        timerTickInternal: TimeInterval = 0.05
    ) {
        self.storiesCount = storiesCount
        self.timerTickInternal = timerTickInternal
        self.progressPerTick = totalProgress / CGFloat(storiesCount) / secondsPerStory * timerTickInternal
    }
}

extension TimerConfiguration {
    func progress(for storyIndex: Int) -> CGFloat {
        return min(CGFloat(storyIndex) / CGFloat(storiesCount), totalProgress)
    }

    func index(for progress: CGFloat) -> Int {
        return min(Int(progress * CGFloat(storiesCount)), storiesCount - 1)
    }

    func nextProgress(progress: CGFloat) -> CGFloat {
        return min(progress + progressPerTick, totalProgress)
    }
    
    func isFinished(progress: CGFloat) -> Bool {
        return progress >= totalProgress
    }

}
