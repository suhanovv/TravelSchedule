//
//  BaseServiceFactory.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 24.08.2025.
//

class BaseApiServiceFactory {
    let clientFactory: ApiClientFactoryProtocol
    
    convenience init() {
        self.init(clientFactory: ApiClientFactory())
    }
    
    init(clientFactory: ApiClientFactoryProtocol) {
        self.clientFactory = clientFactory
    }
    
}
