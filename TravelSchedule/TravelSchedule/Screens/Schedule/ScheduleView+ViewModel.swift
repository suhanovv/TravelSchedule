//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 20.09.2025.
//

import Foundation

extension ScheduleView {
    
    @Observable @MainActor
    final class ViewModel {
        var storiesCards: [Story] = Story.stabStories
        
        var route: RouteModel
        
        var isFormFilledOut: Bool {
            route.from != nil && route.to != nil
        }
        var nameFrom: String? {
            route.from?.title
        }
        
        var nameTo: String? {
            route.to?.title
        }
        
        var from: Station? {
            route.from
        }
        var to: Station? {
            route.to
        }
        
        init(route: RouteModel) {
            self.route = route
            
        }
        
        func swapFromTo() {
            route.swapFromTo()
        }
    }
    
}
