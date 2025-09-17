//
//  CitySelectionViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 10.09.2025.
//

import Foundation
import Combine

@Observable final class CitySelectionViewModel {
    var searchStr: String = ""
    var filteredCities: [City] {
        !searchStr.isEmpty ? cities
            .filter { $0.name.lowercased().contains(searchStr.lowercased()) } : cities
    }
    private var cities: [City] = []

    func loadCities() {
        cities = [
            City(id: 1, name: "Москва"),
            City(id: 2, name: "Санкт-Петербург"),
            City(id: 3, name: "Казань"),
            City(id: 4, name: "Новосибирск"),
            City(id: 5, name: "Екатеринбург"),
            City(id: 6, name: "Нижний Новгород"),
            City(id: 7, name: "Самара"),
            City(id: 8, name: "Ростов-на-Дону"),
            City(id: 9, name: "Владивосток"),
            City(id: 10, name: "Красноярск")
        ]
    }
}
