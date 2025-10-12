//
//  CitySelectionView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 07.09.2025.
//

import SwiftUI


struct CitySelectionView: View {
    @Environment(Coordinator.self) private var coordinator
    @State private var viewModel: ViewModel
    @State private var isSearch: Bool = false
    
    var body: some View {
        List {
            ForEach(viewModel.filteredCities) { city in
                CityAndStationCollectionItemView(text: city.name) {
                    isSearch = false
                    coordinator.push(.stationSelection(viewModel.routeDirectionType, city))
                }
            }
        }
        .overlay {
            ProgressView().opacity(viewModel.progressBarVisible ? 1 : 0)
            Text("Город не найден")
                .modifier(BoldTwentyFour())
                .foregroundColor(.ypBlack)
                .opacity(viewModel.notFoundVisible ? 1 : 0)
        }
        .searchable(
            text: $viewModel.searchStr,
            isPresented: $isSearch,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Введите запрос"
        )
        .background(.ypWhite)
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Выбор города")
        
        .toolbar {
            CustomBackToolbarView()
        }
        .toolbarBackground(Color.ypWhite, for: .navigationBar)

        .task {
            await viewModel.loadCities()
        }
        .onChange(of: viewModel.viewState) { oldValue, newValue in
            switch newValue {
                case .error(let errorType): coordinator.presentFullCover(FullScreenCover.errorScreen(errorType))
                default : break
            }
        }
        .onChange(of: coordinator.fullScreenCover) { oldValue, newValue in
            if oldValue != nil && newValue == nil {
                Task { await viewModel.loadCities() }
            }
        }
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
}
