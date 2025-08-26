//
//  CarrierInfoService.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.08.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Carrier = Components.Schemas.CarrierResponse


protocol CarrierInfoServiceProtocol {
    func getCarrierInfo(code: String) async throws -> Carrier
}

final class CarrierInfoService: CarrierInfoServiceProtocol {
    private let client: APIProtocol
    
    init(client: APIProtocol) {
        self.client = client
    }
    
    func getCarrierInfo(code: String) async throws -> Carrier {
        let response = try await client.getCarrierInfo(query: .init(
            code: code
        ))
        
        return try response.ok.body.json
    }
}
