//
//  StationSelectionViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 10.09.2025.
//

import Foundation
import Combine

extension StationSelectionView {
    @Observable @MainActor
    final class ViewModel {
        private var stations: [Station] = []
        private let apiClient: ApiClient
        let city: City
        let directionType: RouteDirectionType
        var searchStr: String = ""
        var routeModel: RouteModel
        var viewState: ViewState = .initial
        var filteredStations: [Station] {
            !searchStr.isEmpty ? stations
                .filter { $0.title.lowercased().contains(searchStr.lowercased()) } : stations
        }
        var progressBarVisible: Bool {
            viewState == .loading
        }
        
        var notFoundVisible: Bool {
            viewState == .loaded && filteredStations.isEmpty
        }
        
        init(city: City, directionType: RouteDirectionType, routeModel: RouteModel, apiClient: ApiClient) {
            self.city = city
            self.directionType = directionType
            self.routeModel = routeModel
            self.apiClient = apiClient
        }
        
        func selectStation(_ station: Station) {
            routeModel.setStation(kind: directionType, value: station)
        }
        
        func loadStations() async {
            if stations.isEmpty {
                do {
                    viewState = .loading
                    let result = try await apiClient.fetchStations()
                    if let data = result[city] {
                        stations.append(contentsOf: data)
                    }
                    viewState = .loaded
                } catch {
                    viewState = .error(.serverError)
                }
            }
        }
        
    }
}
