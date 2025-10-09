//
//  StoriesProgressBar.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 20.09.2025.
//

import SwiftUI
import Combine

struct StoriesProgressBar: View {
    let storiesCount: Int
    let timerConfiguration: TimerConfiguration
    @Binding var currentProgress: CGFloat
    @Binding var isProgressBarActive: Bool
    @State private var timer: Timer.TimerPublisher
    @State private var cancellable: Cancellable?

    init(storiesCount: Int, timerConfiguration: TimerConfiguration, currentProgress: Binding<CGFloat>, isProgressBarActive: Binding<Bool>) {
        self.storiesCount = storiesCount
        self.timerConfiguration = timerConfiguration
        self._currentProgress = currentProgress
        self.timer = Self.makeTimer(configuration: timerConfiguration)
        self._isProgressBarActive = isProgressBarActive
    }

    var body: some View {
        ProgressBar(numberOfSections: storiesCount, progress: currentProgress)
            .padding(.init(top: 7, leading: 12, bottom: 12, trailing: 12))
            .onAppear {
                if isProgressBarActive {
                    initTimer()
                }
            }
            .onDisappear {
                cancellable?.cancel()
            }
            .onReceive(timer) { _ in
                timerTick()
            }
            .onChange(of: isProgressBarActive) { _, newValue in
                if newValue {
                    initTimer()
                } else {
                    cancellable?.cancel()
                }
            }
    }
    
    private func initTimer() {
        timer = Self.makeTimer(configuration: timerConfiguration)
        cancellable = timer.connect()
    }

    private func timerTick() {
        withAnimation {
            currentProgress = timerConfiguration.nextProgress(progress: currentProgress)
        }
    }
}

extension StoriesProgressBar {
    private static func makeTimer(configuration: TimerConfiguration) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
}
