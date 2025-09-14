//
//  ScheduleModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 13.09.2025.
//

import Foundation

enum TimeFilterType: String, CaseIterable {
    case morning = "Утро 06:00 - 12:00"
    case day = "День 12:00 - 18:00"
    case evening = "Вечер 18:00 - 00:00"
    case night = "Ночь 00:00 - 06:00"
}

enum WithTransitionsOption: String, CaseIterable {
    case yes = "Да"
    case no = "Нет"
}

@Observable class ScheduleSearchParams {
    var from: Station?
    var to: Station?
    var selectedTimes: Set<TimeFilterType> = []
    var selectedTransitions: WithTransitionsOption?
    
    init(
        from: Station? = nil,
        to: Station? = nil,
        selectedTimes: Set<TimeFilterType> = [],
        selectedTransitions: WithTransitionsOption? = nil
    ) {
        self.from = from
        self.to = to
        self.selectedTimes = selectedTimes
        self.selectedTransitions = selectedTransitions
    }
}
