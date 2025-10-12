//
//  RouteFormModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 04.10.2025.
//

import SwiftUI

@Observable
final class RouteModel {
    private(set) var from: Station?
    private(set) var to: Station?
    
    func swapFromTo() {
        (from, to) = (to, from)
    }
    
    func setStation(kind: RouteDirectionType, value: Station) {
        switch kind {
            case .from: from = value
            case .to: to = value
        }
    }
}
