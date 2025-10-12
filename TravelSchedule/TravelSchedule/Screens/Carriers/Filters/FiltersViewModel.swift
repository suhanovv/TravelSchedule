//
//  FiltersViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 17.09.2025.
//

import Foundation

extension FiltersView {
    @Observable @MainActor
    final class ViewModel {
        var filterModel: ThreadFilterModel
        var isFiltersChanged: Bool {
            localFilterModel != filterModel
        }
        var localFilterModel: ThreadFilterModel
        
        init(filterModel: ThreadFilterModel) {
            self.filterModel = filterModel
            self.localFilterModel = .init(
                selectedTimes: filterModel.selectedTimes,
                selectedTransitions: filterModel.selectedTransitions
            )
        }
        
        func updateLocalFilters() {
            localFilterModel.selectedTimes = filterModel.selectedTimes
            localFilterModel.selectedTransitions = filterModel.selectedTransitions
        }
        
        func saveFilters() {
            filterModel.selectedTimes = localFilterModel.selectedTimes
            filterModel.selectedTransitions = localFilterModel.selectedTransitions
        }
    }
}
