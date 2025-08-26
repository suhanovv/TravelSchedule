//
//  CopyrightService.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.08.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Copyright = Components.Schemas.CopyrightResponse


protocol CopyrightServiceProtocol {
    func getCopyright() async throws -> Copyright
}

final class CopyrightService: CopyrightServiceProtocol {
    private let client: APIProtocol
    
    init(client: APIProtocol) {
        self.client = client
    }
    
    func getCopyright() async throws -> Copyright {
        let response = try await client.getCopyright(query: .init())
        
        return try response.ok.body.json
    }
}
