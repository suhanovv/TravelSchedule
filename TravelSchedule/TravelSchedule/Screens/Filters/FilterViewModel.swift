//
//  FilterViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 13.09.2025.
//

import Foundation


@Observable final class FilterViewModel {
    private(set) var selectedTimes: Set<TimeFilterType>
    private(set) var selectedTransitions: WithTransitionsOption?
    private(set) var searchParams: ScheduleSearchParams
    
    
    init(searchParams: ScheduleSearchParams) {
        self.selectedTimes = searchParams.selectedTimes
        self.selectedTransitions = searchParams.selectedTransitions
        self.searchParams = searchParams
    }
    
    func changeTimeFilter(_ timeFileter: TimeFilterType) {
        if selectedTimes.contains(timeFileter) {
            selectedTimes.remove(timeFileter)
        } else {
            selectedTimes.insert(timeFileter)
        }
    }
    
    func changeTransitions(_ transitions: WithTransitionsOption) {
        if selectedTransitions == transitions {
            selectedTransitions = nil
        } else {
            selectedTransitions = transitions
        }
    }
    
    func apply() {
        searchParams.selectedTimes = selectedTimes
        searchParams.selectedTransitions = selectedTransitions
    }
}
