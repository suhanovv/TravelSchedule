//
//  MainView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.08.2025.
//

import SwiftUI

struct MainView: View {
    private let backgroundColor: Color = .ypWhite
    @State private var scheduleSearchParams = ScheduleSearchParams()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            TabView() {
                Group {
                    sheduleTabView
                    settingsTabView
                }
                .background(backgroundColor)
            }
            .tint(.ypBlack)
            .environment(scheduleSearchParams)
            .navigationDestination(for: NavigationRoute.self) { screen in
                switch screen {
                    case .citySelection(let directionType):
                        CitySelectionView(routeDirectionType: directionType, path: $path)
                        
                    case .stationSelection(let directionType, let city):
                        StationSelectionView(
                            viewModel: StationSelectionViewModel(city: city),
                            path: $path,
                            selectedStation: directionType == .from ? $scheduleSearchParams.from : $scheduleSearchParams.to
                        )
                        
                    case .carriersList: CarriersListView(viewModel: CarriersListViewModel(searchParams: scheduleSearchParams))
                    case .carrierInfo(let carrier): CarrierInfoView(carrier: carrier)
                    case .filterScreen: FiltersView(viewModel: FilterViewModel(searchParams: scheduleSearchParams))
                }
            }
        }
    }
    
    private var sheduleTabView: some View {
        VStack {
            ScheduleView(searchParams: scheduleSearchParams)
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
