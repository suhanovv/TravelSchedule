//
//  CitySelection+ViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 10.09.2025.
//

import Foundation
import Combine
import OpenAPIRuntime

extension CitySelectionView {
    @Observable @MainActor
    final class ViewModel {
        private var cities: [City] = []
        private let apiClient: ApiClient
        var viewState: ViewState = .initial
        var routeDirectionType: RouteDirectionType
        var searchStr: String = ""
        var filteredCities: [City] {
            !searchStr.isEmpty ? cities
                .filter { $0.name.lowercased().contains(searchStr.lowercased()) } : cities
        }
        var progressBarVisible: Bool {
            viewState == .loading
        }

        var notFoundVisible: Bool {
            viewState == .loaded && filteredCities.isEmpty
        }
        
        init(routeDirectionType: RouteDirectionType, apiClient: ApiClient) {
            self.routeDirectionType = routeDirectionType
            self.apiClient = apiClient
        }
        
        func loadCities() async -> Void {
            if cities.isEmpty {
                do {
                    viewState = .loading
                    let response = try await apiClient.fetchStations()
                    
                    cities.append(contentsOf: response.keys)
                    viewState = .loaded
                } catch {
                    viewState = .error(.serverError)
                }
            }
        }
    }
}
