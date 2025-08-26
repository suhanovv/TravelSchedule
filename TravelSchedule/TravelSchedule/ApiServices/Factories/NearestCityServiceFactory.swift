//
//  NearestCityServiceFactory.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 24.08.2025.
//

final class NearestCityServiceFactory: BaseApiServiceFactory, ApiServiceFactoryProtocol {
    
    func makeService() throws -> NearestCityServiceProtocol {
        NearestCityService(
            client: try clientFactory.makeClient()
        )
    }
}

