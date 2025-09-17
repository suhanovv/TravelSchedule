//
//  StationSelectionViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 10.09.2025.
//

import Foundation
import Combine

@Observable final class StationSelectionViewModel {
    var searchStr: String = ""
    var filteredStations: [Station] {
        !searchStr.isEmpty ? stations
            .filter { $0.name.lowercased().contains(searchStr.lowercased()) } : stations
    }
    private var stations: [Station] = []
    
    func loadStations(city: City) {
        stations = [
            Station(id: 1, name: "Москва Ленинградский вокзал"),
                Station(id: 2, name: "Москва Казанский вокзал"),
                Station(id: 3, name: "Москва Ярославский вокзал"),
                Station(id: 4, name: "Санкт-Петербург Московский вокзал"),
                Station(id: 5, name: "Санкт-Петербург Ладожский вокзал"),
                Station(id: 6, name: "Казань-Пассажирская"),
                Station(id: 7, name: "Новосибирск-Главный"),
                Station(id: 8, name: "Екатеринбург-Пассажирский"),
                Station(id: 9, name: "Нижний Новгород Московский"),
                Station(id: 10, name: "Самара"),
                Station(id: 11, name: "Ростов-Главный"),
                Station(id: 12, name: "Владивосток"),
                Station(id: 13, name: "Красноярск-Пассажирский")
        ]
    }

}
