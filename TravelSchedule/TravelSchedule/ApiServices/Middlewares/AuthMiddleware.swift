//
//  AuthMiddleware.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 26.08.2025.
//

import Foundation

import OpenAPIRuntime
import HTTPTypes

struct AuthMiddleware: ClientMiddleware {
    let authKey: String
    
    func intercept(
        _ request: HTTPRequest,
        body: HTTPBody?,
        baseURL: URL,
        operationID: String,
        next: (HTTPRequest, HTTPBody?, URL) async throws -> (HTTPResponse, HTTPBody?)
    ) async throws -> (HTTPResponse, HTTPBody?) {
        var request = request
        request.headerFields[.authorization] = authKey
        return try await next(request, body, baseURL)
    }
}
