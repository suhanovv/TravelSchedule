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


protocol StationScheduleServiceProtocol: Sendable {
    func getScheduleBetweenStations(from: String, to: String, transfers: Bool) async throws -> Schedule
    func getStationSchedule(station: String) async throws -> StationSchedule
}

final class StationScheduleService: StationScheduleServiceProtocol, Sendable {

    private let client: APIProtocol
    
    init(client: APIProtocol) {
        self.client = client
    }
    
    func getScheduleBetweenStations(from: String, to: String, transfers: Bool) async throws -> Schedule {
        let response = try await client.getScheduleBetweenStations(query: .init(
            from: from,
            to: to,
            transfers: transfers
        ))
        
        return try response.ok.body.json
    }

    func getStationSchedule(station: String) async throws -> StationSchedule {
        let response = try await client.getStationSchedule(query: .init(
            
            station: station
        ))
        
        return try response.ok.body.json
    }
}

extension StationScheduleServiceProtocol {
    func getScheduleBetweenStations(from: String, to: String, transfers: Bool = false) async throws -> Schedule {
        try await getScheduleBetweenStations(from: from, to: to, transfers: transfers)
    }
}
