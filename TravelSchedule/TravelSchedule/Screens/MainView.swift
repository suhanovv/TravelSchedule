//
//  MainView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.08.2025.
//

import SwiftUI

struct MainView: View {
    private let backgroundColor: Color = .ypWhite
    @State private var path = NavigationPath()
    @State private var routeModel: RouteFormModel = .init()
    @State private var filterModel: ThreadFilterModel = .init()
    
    var body: some View {
        NavigationStack(path: $path) {
            TabView() {
                Group {
                    scheduleTabView
                    settingsTabView
                }
                .background(backgroundColor)
            }
            .tint(.ypBlack)
            .navigationDestination(for: NavigationRoute.self) { screen in
                switch screen {
                    case .citySelection(let directionType):
                        CitySelectionView(routeDirectionType: directionType, path: $path)
                        
                    case .stationSelection(let directionType, let city):
                        StationSelectionView(
                            city: city,
                            path: $path,
                            selectedStation: directionType == .from ? $routeModel.from : $routeModel.to
                        )
                        
                    case .carriersList(let from, let to): ThreadsListView(
                        from: from,
                        to: to,
                        filterModel: $filterModel,
                        path: $path
                    )
                    case .carrierInfo(let carrier): CarrierInfoView(carrier: carrier)
                    case .filterScreen: FiltersView(filterModel: $filterModel)
                    case .licenseScreen: OfertaView(path: $path)
                }
            }
        }
    }
    
    private var scheduleTabView: some View {
        VStack {
            ScheduleView(formModel: $routeModel)
            Spacer()
            Divider()
        }
        .tabItem {
            Image(.scheduleIcon)
        }
    }
    private var settingsTabView: some View {
        VStack {
            SettingsView()
            Spacer()
            Divider()
        }
        .tabItem {
            Image(.settingsIcon)
        }
    }
}

#Preview {
    MainView()
}
