//
//  StationsService.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.08.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession
import Foundation

typealias AllStations = Components.Schemas.AllStationsResponse


protocol StationsServiceProtocol {
    func getAllStations() async throws -> AllStations
}

final class StationsService: StationsServiceProtocol {
    private let client: APIProtocol
    private let apiKey: String
    
    init(client: APIProtocol, apiKey: String) {
        self.apiKey = apiKey
        self.client = client
    }
    
    func getAllStations() async throws -> AllStations {
        let response = try await client.getAllStations(query: .init(
            apikey: apiKey
        ))
        
        var fullData = Data()
       
        for try await chunk in try response.ok.body.text_html_charset_utf_hyphen_8 {
            fullData.append(contentsOf: chunk)
        }
        
        return try JSONDecoder().decode(AllStations.self, from: fullData)
    }
}
