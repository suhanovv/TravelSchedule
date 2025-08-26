//
//  ThreadStationsServiceFactory.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 24.08.2025.
//

final class ThreadStationsServiceFactory: BaseApiServiceFactory, ApiServiceFactoryProtocol {
    
    func makeService() throws -> ThreadStationsServiceProtocol {
        ThreadStationsService(
            client: try clientFactory.makeClient()
        )
    }
}

