//
//  FiltersViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 17.09.2025.
//

import Foundation

@Observable final class FiltersViewModel {
    func isFiltersChanged(localState: ThreadFilterModel, globalState: ThreadFilterModel) -> Bool {
        localState != globalState
    }
}
