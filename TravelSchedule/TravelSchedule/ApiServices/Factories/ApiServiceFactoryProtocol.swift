//
//  ApiServiceFactoryProtocol.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 24.08.2025.
//

protocol ApiServiceFactoryProtocol {
    associatedtype T
    func makeService() throws -> T
}
