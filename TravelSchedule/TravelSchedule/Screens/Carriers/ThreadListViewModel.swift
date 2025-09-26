//
//  CarriersViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 08.09.2025.
//

import Foundation

import Combine

struct CarrierInfo: Hashable {
    let code: Int
    let name: String
    let logo: String
    let email: String?
    let phone: String?
}

struct ThreadListItem: Identifiable, Hashable {
    let id: UUID
    let carrierInfo: CarrierInfo
    let arrivalTime: Date
    let departureTime: Date
    let duration: Duration
    let startDate: Date
    let transition: String?
    
    var formattedDuration: String {
        duration.formatted(.units(allowed: [.hours], width: .wide))
    }
    
    var formattedDepartureTime: String {
        departureTime.hoursAndMinutesString
    }
    
    var formattedStartDate: String {
        startDate.carriersListItemDateString
    }
    
    var formattedArrivalTime: String {
        arrivalTime.hoursAndMinutesString
    }
}

@Observable final class ThreadListViewModel {
    private(set) var threads: [ThreadListItem] = []

    
    func makeTitle(from: Station, to: Station) -> String {
        "\(from.name) → \(to.name)"
    }

    func loadData(from: Station, to: Station) {
        threads = [
            .init(
                id: UUID(),
                carrierInfo: CarrierInfo(code: 8565, name: "Русская Авиакомпания", logo: "https://yastat.net/s3/rasp/media/data/company/logo/gazpr.jpg", email: "foo@bar.com", phone: ""),
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: "С пересадкой в костроме"
                ),
            .init(
                id: UUID(),
                carrierInfo: CarrierInfo(code: 9144, name: "Победа", logo: "https://yastat.net/s3/rasp/media/data/company/logo/ru_2.png", email: nil, phone: ""),
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: nil
            ),
            .init(
                id: UUID(),
                carrierInfo: CarrierInfo(code: 8565, name: "Россия", logo:  "https://yastat.net/s3/rasp/media/data/company/logo/logorus_1.jpg", email: nil, phone: ""),
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: "С пересадкой в костроме"
                ),
            .init(
                id: UUID(),
                carrierInfo: CarrierInfo(code: 8565, name: "Россия", logo:  "https://yastat.net/s3/rasp/media/data/company/logo/logorus_1.jpg", email: nil, phone: ""),
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: nil
            ),
            .init(
                id: UUID(),
                carrierInfo: CarrierInfo(code: 9144, name: "Победа", logo: "https://yastat.net/s3/rasp/media/data/company/logo/ru_2.png", email: "foo@bar.com", phone: "+7 (904) 329-12-34"),
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: "С пересадкой в костроме"
                ),
            .init(
                id: UUID(),
                carrierInfo: CarrierInfo(code: 9144, name: "Победа", logo: "https://yastat.net/s3/rasp/media/data/company/logo/ru_2.png", email: nil, phone: ""),
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: nil
            ),
            .init(
                id: UUID(),
                carrierInfo: CarrierInfo(code: 8565, name: "Россия", logo:  "https://yastat.net/s3/rasp/media/data/company/logo/logorus_1.jpg", email: nil, phone: ""),
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: "С пересадкой в костроме"
                ),
            .init(
                id: UUID(),
                carrierInfo: CarrierInfo(code: 8565, name: "Россия", logo:  "https://yastat.net/s3/rasp/media/data/company/logo/logorus_1.jpg", email: nil, phone: ""),
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: nil
            ),
        ]
    }
}
