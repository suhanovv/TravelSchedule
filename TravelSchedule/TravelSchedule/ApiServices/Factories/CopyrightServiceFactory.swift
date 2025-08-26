//
//  CopyrightServiceFactory.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 24.08.2025.
//

final class CopyrightServiceFactory: BaseApiServiceFactory, ApiServiceFactoryProtocol {
    
    func makeService() throws -> CopyrightServiceProtocol {
        CopyrightService(
            client: try clientFactory.makeClient()
        )
    }
}

