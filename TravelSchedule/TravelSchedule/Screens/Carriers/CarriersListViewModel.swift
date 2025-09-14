//
//  CarriersViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 08.09.2025.
//

import Foundation

import Combine

struct CarrierListItem: Identifiable, Hashable {
    let id: UUID
    let name: String
    let logo: String
    let arrivalTime: Date
    let departureTime: Date
    let duration: Duration
    let startDate: Date
    let transition: String?
    
    func formatedDuration() -> String {
        duration.formatted(.units(allowed: [.hours], width: .wide))
    }
    
    func formattedDepartureTime() -> String {
        departureTime.hoursAndMinutesString()
    }
}

@Observable final class CarriersListViewModel {
    private(set) var carriers: [CarrierListItem] = []
    private(set) var searchParams: ScheduleSearchParams
    var title: String {
        if let from = searchParams.from, let to = searchParams.to {
            return "\(from.name) → \(to.name)"
        } else {
            return "Не указано"
        }
    }
    
    init(searchParams: ScheduleSearchParams) {
        self.searchParams = searchParams
    }
    
    func isAnyFilterActive() -> Bool {
        !searchParams.selectedTimes.isEmpty || searchParams.selectedTransitions != nil
    }

    func loadData() {
        carriers = [
            .init(
                id: UUID(),
                name: "Русская Авиакомпания",
                logo: "https://yastat.net/s3/rasp/media/data/company/logo/gazpr.jpg",
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: "С пересадкой в костроме"
                ),
            .init(
                id: UUID(),
                name: "Аэрофлот",
                logo: "https://yastat.net/s3/rasp/media/data/company/logo/logorus_1.jpg",
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: nil
            ),
            .init(
                id: UUID(),
                name: "Русская Авиакомпания",
                logo: "https://yastat.net/s3/rasp/media/data/company/logo/gazpr.jpg",
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: "С пересадкой в костроме"
                ),
            .init(
                id: UUID(),
                name: "Аэрофлот",
                logo: "https://yastat.net/s3/rasp/media/data/company/logo/logorus_1.jpg",
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: nil
            ),
            .init(
                id: UUID(),
                name: "Русская Авиакомпания",
                logo: "https://yastat.net/s3/rasp/media/data/company/logo/gazpr.jpg",
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: "С пересадкой в костроме"
                ),
            .init(
                id: UUID(),
                name: "Аэрофлот",
                logo: "https://yastat.net/s3/rasp/media/data/company/logo/logorus_1.jpg",
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: nil
            ),
            .init(
                id: UUID(),
                name: "Русская Авиакомпания",
                logo: "https://yastat.net/s3/rasp/media/data/company/logo/gazpr.jpg",
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: "С пересадкой в костроме"
                ),
            .init(
                id: UUID(),
                name: "Аэрофлот",
                logo: "https://yastat.net/s3/rasp/media/data/company/logo/logorus_1.jpg",
                arrivalTime: Date(),
                departureTime: Date(),
                duration: .seconds(10000),
                startDate: Date(),
                transition: nil
            ),
        ]
    }
}
