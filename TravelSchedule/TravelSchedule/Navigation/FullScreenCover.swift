//
//  FullScreenCover.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 05.10.2025.
//

import Foundation


enum FullScreenCover: Identifiable, Equatable {
    var id: UUID { UUID() }
        
    case errorScreen(ErrorType)
    
}
