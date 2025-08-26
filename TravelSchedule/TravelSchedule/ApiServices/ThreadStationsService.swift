//
//  ThreadStationsService.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.08.2025.
//

import Foundation

import OpenAPIRuntime
import OpenAPIURLSession

typealias ThreadStation = Components.Schemas.ThreadStationsResponse

protocol ThreadStationsServiceProtocol {
    func getThreadStations(threadId: String, from: String?, to: String?, date: Date?) async throws -> ThreadStation
}

final class ThreadStationsService: ThreadStationsServiceProtocol {
    private let client: APIProtocol
    
    init(client: APIProtocol) {
        self.client = client
    }
    
    func getThreadStations(threadId: String, from: String?, to: String?, date: Date?) async throws -> ThreadStation {
        let response = try await client.getRouteStations(query: .init(
            uid: threadId,
            from: from,
            to: to,
            date: date?.ISO8601Format()
        ))
        
        return try response.ok.body.json
    }
}

extension ThreadStationsServiceProtocol {
    func getThreadStations(threadId: String, from: String? = nil, to: String? = nil, date: Date? = nil) async throws -> ThreadStation {
        try await getThreadStations(threadId: threadId, from: from, to: to, date: date)
    }
}
