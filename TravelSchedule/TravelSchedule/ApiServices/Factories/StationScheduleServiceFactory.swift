//
//  StationScheduleServiceFactory.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 24.08.2025.
//

final class StationScheduleServiceFactory: BaseApiServiceFactory, ApiServiceFactoryProtocol {
    
    func makeService() throws -> StationScheduleServiceProtocol {
        StationScheduleService(
            client: try clientFactory.makeClient(),
            apiKey: AppConfig.apiKey
        )
    }
}

