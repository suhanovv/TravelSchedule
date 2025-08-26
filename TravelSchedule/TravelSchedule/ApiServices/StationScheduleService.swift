//
//  StationScheduleService.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.08.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession
import Foundation

typealias Schedule = Components.Schemas.Segments
typealias StationSchedule = Components.Schemas.ScheduleResponse


protocol StationScheduleServiceProtocol {
    func getScheduleBetweenStations(from: String, to: String, date: Date?) async throws -> Schedule
    func getStationSchedule(station: String, date: Date?) async throws -> StationSchedule
}

final class StationScheduleService: StationScheduleServiceProtocol {

    private let client: APIProtocol
    
    init(client: APIProtocol) {
        self.client = client
    }
    
    func getScheduleBetweenStations(from: String, to: String, date: Date?) async throws -> Schedule {
        let response = try await client.getScheduleBetweenStations(query: .init(
            from: from,
            to: to,
            date: date?.ISO8601Format()
        ))
        
        return try response.ok.body.json
    }

    func getStationSchedule(station: String, date: Date?) async throws -> StationSchedule {
        let response = try await client.getStationSchedule(query: .init(
            
            station: station,
            date: date?.ISO8601Format()
        ))
        
        return try response.ok.body.json
    }
}

extension StationScheduleServiceProtocol {
    func getScheduleBetweenStations(from: String, to: String, date: Date? = nil) async throws -> Schedule {
        try await getScheduleBetweenStations(from: from, to: to, date: date)
    }
    func getStationSchedule(station: String, date: Date? = nil) async throws -> StationSchedule {
        try await getStationSchedule(station: station, date: date)
    }
}
