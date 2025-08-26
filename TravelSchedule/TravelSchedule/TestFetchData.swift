//
//  TestFetchData.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 25.08.2025.
//

import Foundation

final class TestFetchData {
    
    func testFetchNearestStations() {
        Task {
            do {
                let service = try NearestStationsServiceFactory().makeService()
                print("Fetching nearest stations...")
                let stations = try await service.getNearestStations(
                    lat: 59.864177,
                    lng: 30.319163,
                    distance: 50
                )
                print("Successfully fetched nearest stations: \(stations)")
            } catch {
                print("Error fetching nearest stations: \(error)")
            }
        }
    }
    
    func testFetchNearestCity() {
        Task {
            do {
                let service = try NearestCityServiceFactory().makeService()
                print("Fetching nearest city...")
                let stations = try await service.getNearestCity(
                    lat: 59.864177,
                    lng: 30.319163
                )
                print("Successfully fetched nearest city: \(stations)")
            } catch {
                print("Error fetching nearest city: \(error)")
            }
        }
    }
    
    func testFetchThreadStations() {
        Task {
            do {
                let service = try ThreadStationsServiceFactory().makeService()
                print("Fetching route stations...")
                let stations = try await service.getThreadStations(threadId: "FV-6182_250826_c8565_12", date: Date())
                print("Successfully fetched route stations: \(stations)")
            } catch {
                print("Error fetching route stations: \(error)")
            }
        }
    }
    
    func testFetchCarrier() {
        Task {
            do {
                let service = try CarrierInfoServiceFactory().makeService()
                
                print("Fetching carriers...")
                let carriers = try await service.getCarrierInfo(code: "680")
                print("Successfully fetched carriers: \(carriers)")
            } catch {
                print("Error fetching carriers: \(error)")
            }
        }
    }
    
    func testFetchCopyrightInfo() {
        Task {
            do {
                let service = try CopyrightServiceFactory().makeService()
                
                print("Fetching copyright...")
                let copyright = try await service.getCopyright()
                print("Successfully fetched copyright: \(copyright)")
            } catch {
                print("Error fetching copyright: \(error)")
            }
        }
    }
    
    func testFetchScheduleBetweenStations() {
        Task {
            do {
                let service = try StationScheduleServiceFactory().makeService()
                
                print("Fetching schedule between stations...")
                let carriers = try await service.getScheduleBetweenStations(from: "s9600215", to: "s9600366", date: Date())
                print("Successfully schedule between stations: \(carriers)")
            } catch {
                print("Error fetching schedule between stations: \(error)")
            }
        }
    }
    
    func testStationSchedule() {
        Task {
            do {
                let service = try StationScheduleServiceFactory().makeService()
                
                print("Fetching station schedule ...")
                let carriers = try await service.getStationSchedule(station: "s9600215", date: Date())
                print("Successfully station schedule : \(carriers)")
            } catch {
                print("Error fetching station schedule : \(error)")
            }
        }
    }
    
    func testFetchAllStations() {
        Task {
            do {
                let service = try StationsServiceFactory().makeService()

                print("Fetching all stations...")
                let stations = try await service.getAllStations()
                print(
                    "Successfully fetched all stations: \(stations.countries?.first)"
                )
            } catch {
                print("Error fetching all stations: \(error)")
            }
        }
    }
    
}
