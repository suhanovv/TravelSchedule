//
//  NavigationRoute.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 13.09.2025.
//

import Foundation

enum NavigationRoute: Hashable {
    case citySelection(RouteDirectionType)
    case stationSelection(RouteDirectionType, City)
    case carriersList(Station, Station)
    case carrierInfo(CarrierInfo)
    case filterScreen
    case licenseScreen
}
