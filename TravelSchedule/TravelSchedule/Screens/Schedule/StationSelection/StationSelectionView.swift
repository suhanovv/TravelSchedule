//
//  StationSelectionView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 07.09.2025.
//

import SwiftUI

struct StationSelectionView: View {
    @Environment(Coordinator.self) private var coordinator
    @State private var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.filteredStations, id: \.id) { station in
                CityAndStationCollectionItemView(text: station.title) {
                    viewModel.selectStation(station)
                    coordinator.popToRoot()
                }
            }
        }
        .overlay {
            ProgressView().opacity(viewModel.progressBarVisible ? 1 : 0)
            Text("Станция не найдена")
                .modifier(BoldTwentyFour())
                .foregroundColor(.ypBlack)
                .opacity(viewModel.notFoundVisible ? 1 : 0)
        }
        .searchable(
            text: $viewModel.searchStr,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Введите запрос"
        )
        .background(.ypWhite)
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Выбор станции")
        
        .toolbar {
            CustomBackToolbarView()
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .task {
            await viewModel.loadStations()
        }
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
}

