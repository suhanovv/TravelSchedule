//
//  StationsServiceFactory.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 24.08.2025.
//

final class StationsServiceFactory: BaseApiServiceFactory, ApiServiceFactoryProtocol {
    
    func makeService() throws -> StationsServiceProtocol {
        StationsService(
            client: try clientFactory.makeClient(),
            apiKey: AppConfig.apiKey
        )
    }
}

