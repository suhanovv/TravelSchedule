//
//  ApiClientFactory.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 24.08.2025.
//

import OpenAPIURLSession

protocol ApiClientFactoryProtocol {
    func makeClient() throws -> APIProtocol
}

final class ApiClientFactory: ApiClientFactoryProtocol {
    func makeClient() throws -> APIProtocol {
        Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport(),
            middlewares: [AuthMiddleware(authKey: AppConfig.apiKey)]
        )
    }
}
