//
//  NearestCityService.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.08.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestCity = Components.Schemas.NearestCityResponse


protocol NearestCityServiceProtocol {
    func getNearestCity(lat: Double, lng: Double, distance: Int?) async throws -> NearestCity
}

final class NearestCityService: NearestCityServiceProtocol {
    private let client: APIProtocol
    
    init(client: APIProtocol) {
        self.client = client
    }
    
    func getNearestCity(lat: Double, lng: Double, distance: Int?) async throws -> NearestCity {
        let response = try await client.getNearestCity(query: .init(
            lat: lat,
            lng: lng,
            distance: distance
        ))
        
        return try response.ok.body.json
    }
}

extension NearestCityServiceProtocol {
    func getNearestCity(lat: Double, lng: Double, distance: Int? = nil) async throws -> NearestCity {
        try await self.getNearestCity(lat: lat, lng: lng, distance: distance)
    }
}
