//
//  NearestStationsServiceFactory.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 24.08.2025.
//

final class NearestStationsServiceFactory: BaseApiServiceFactory, ApiServiceFactoryProtocol {
    
    func makeService() throws -> NearestStationsServiceProtocol {
        NearestStationsService(
            client: try clientFactory.makeClient(),
            apiKey: AppConfig.apiKey
        )
    }
}

