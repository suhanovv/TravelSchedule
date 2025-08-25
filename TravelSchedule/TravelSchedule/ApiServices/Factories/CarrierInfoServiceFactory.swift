//
//  CarrierInfoServiceFactory.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 24.08.2025.
//

final class CarrierInfoServiceFactory: BaseApiServiceFactory, ApiServiceFactoryProtocol {
    
    func makeService() throws -> CarrierInfoServiceProtocol {
        CarrierInfoService(
            client: try clientFactory.makeClient(),
            apiKey: AppConfig.apiKey
        )
    }
}
