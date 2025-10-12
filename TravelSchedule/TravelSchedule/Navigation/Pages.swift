//
//  Pages.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 04.10.2025.
//

import Foundation

enum Pages: Hashable {
    case mainScreen
    case citySelection(RouteDirectionType)
    case schedule
    case settings
    case stationSelection(RouteDirectionType, City)
    case carriersList(Station, Station)
    case carrierInfo(CarrierInfo)
    case filterScreen
    case licenseScreen
}

