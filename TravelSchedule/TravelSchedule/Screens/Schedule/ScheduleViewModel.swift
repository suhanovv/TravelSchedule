//
//  ScheduleFormViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 10.09.2025.
//

import Foundation

@Observable final class ScheduleViewModel {
    var searchParams: ScheduleSearchParams
    var from: String? {
        searchParams.from?.name
    }
    var to: String? {
        searchParams.to?.name
    }
    
    init(scheduleSearchParams: ScheduleSearchParams) {
        self.searchParams = scheduleSearchParams
    }
    
    var isFormValid: Bool {
        searchParams.from != nil && searchParams.to != nil
    }
    
    func swapFromTo() {
        (searchParams.from, searchParams.to) = (searchParams.to, searchParams.from)
    }
}
