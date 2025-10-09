//
//  ApiClient.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 06.10.2025.
//

import Foundation

actor ApiClient {
    private let russiaCountryCode = "l225"
    private var cache: [City: [Station]] = [:]
    
    private let stationService: StationsServiceProtocol
    private let scheduleService: StationScheduleServiceProtocol
    
    init(stationService: StationsServiceProtocol, scheduleService: StationScheduleServiceProtocol) {
        self.stationService = stationService
        self.scheduleService = scheduleService
    }
    
    func fetchStations() async throws -> [City: [Station]] {
        if !cache.isEmpty {
            return cache
        }
        var cityAndStations: [City: [Station]] = [:]
        let response = try await stationService.getAllStations()
        
        for country in response.countries ?? [] {
            if country.codes?.yandex_code != russiaCountryCode {
                continue
            }
            for region in country.regions ?? [] {
                for settlement in region.settlements ?? [] {
                    if
                        let cityCode = settlement.codes?.yandex_code,
                        let cityName = settlement.title,
                        let stations = settlement.stations
                    {
                        let city = City(id: cityCode, name: cityName)
                        let cityStations = stations.compactMap { station in
                            if
                                let code = station.codes?.yandex_code,
                                let title = station.title
                            {
                                return Station(id: code, title: title, city: city)
                            } else {
                                return nil
                            }
                        }
                        
                        if !cityStations.isEmpty {
                            cityAndStations[city] = cityStations
                        }
                    }
                }
            }
            
        }
        cache = cityAndStations
        return cityAndStations
    }
    
    func getSchedule(from: String, to: String, hasTransfers: Bool = false) async throws -> Schedule {
        return try await scheduleService.getScheduleBetweenStations(from: from, to: to, transfers: hasTransfers)
    }
}
