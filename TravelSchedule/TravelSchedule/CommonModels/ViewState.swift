//
//  ViewState.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 08.10.2025.
//

import Foundation

enum ViewState: Equatable {
    case loading
    case loaded
    case error(ErrorType)
    case initial
}
