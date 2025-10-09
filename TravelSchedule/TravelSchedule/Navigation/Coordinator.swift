//
//  Coordinator.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 04.10.2025.
//

import SwiftUI

@Observable @MainActor
final class Coordinator {
    var path = NavigationPath()
    var fullScreenCover: FullScreenCover?
    var routeModel = RouteModel()
    var filterModel: ThreadFilterModel = ThreadFilterModel()
    var apiClient: ApiClient?
    
    init() {
        apiClient = try? .init(
            stationService: StationsServiceFactory().makeService(),
            scheduleService: StationScheduleServiceFactory().makeService())
    }
    
    @ViewBuilder
    func build(page: Pages) -> some View {
        switch page {
            case .mainScreen: MainView()
            case .citySelection(let directionType):
                if let apiClient {
                    CitySelectionView(
                        viewModel: .init(routeDirectionType: directionType, apiClient: apiClient)
                    )}
            case .schedule: ScheduleView(viewModel: .init(route: routeModel))
            case .settings: SettingsView()
            case .stationSelection(let directionType, let city):
                if let apiClient {
                    StationSelectionView(viewModel: .init(
                        city: city,
                        directionType: directionType,
                        routeModel: routeModel,
                        apiClient: apiClient
                    ))
                }
            case .carriersList(let from, let to):
                if let apiClient {
                    ThreadsListView(viewModel: .init(
                        from: from,
                        to: to,
                        filterModel: filterModel,
                        apiClient: apiClient
                    ))
                }
                
            case .carrierInfo(let carrier): CarrierInfoView(carrier: carrier)
            case .filterScreen: FiltersView(viewModel: .init(filterModel: filterModel))
            case .licenseScreen: OfertaView()
        }
    }
    
    @ViewBuilder
    func build(cover: FullScreenCover) -> some View {
        switch cover {
            case .errorScreen(let errorType): ErrorView(errorType: errorType)
        }
    }
    
    func push(_ page: Pages) {
        path.append(page)
    }
    
    func presentFullCover(_ cover: FullScreenCover) {
        fullScreenCover = cover
    }
    
    func dismissFullCover() {
        fullScreenCover = nil
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        guard !path.isEmpty else { return }
        path.removeLast(path.count)
    }
}
