//
//  CarriersFilterModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 17.09.2025.
//

import Foundation

enum TimeFilterType: String, CaseIterable {
    case morning = "Утро 06:00 - 12:00"
    case day = "День 12:00 - 18:00"
    case evening = "Вечер 18:00 - 00:00"
    case night = "Ночь 00:00 - 06:00"
    
    var timeRange: ClosedRange<Int> {
        switch self {
            case .morning:
                return 6...11
            case .day:
                return 12...17
            case .evening:
                return 18...23
            case .night:
                return 0...5
        }
    }
}

enum WithTransitionsOption: String, CaseIterable {
    case yes = "Да"
    case no = "Нет"
}

@Observable
final class ThreadFilterModel: Equatable {
    var selectedTimes: Set<TimeFilterType>
    var selectedTransitions: WithTransitionsOption?
    var isAnyFilterActive: Bool {
        !selectedTimes.isEmpty || selectedTransitions != nil
    }
    
    init(selectedTimes: Set<TimeFilterType> = [], selectedTransitions: WithTransitionsOption? = nil) {
        self.selectedTimes = selectedTimes
        self.selectedTransitions = selectedTransitions
    }
    
    static func == (lhs: ThreadFilterModel, rhs: ThreadFilterModel) -> Bool {
        lhs.selectedTimes == rhs.selectedTimes &&
        lhs.selectedTransitions == rhs.selectedTransitions
    }
    
    func changeTimeFilter(_ timeFilter: TimeFilterType) {
        if selectedTimes.contains(timeFilter) {
            selectedTimes.remove(timeFilter)
        } else {
            selectedTimes.insert(timeFilter)
        }
    }
    
    func changeTransitions(_ transitions: WithTransitionsOption) {
        if selectedTransitions == transitions {
            selectedTransitions = nil
        } else {
            selectedTransitions = transitions
        }
    }
}
