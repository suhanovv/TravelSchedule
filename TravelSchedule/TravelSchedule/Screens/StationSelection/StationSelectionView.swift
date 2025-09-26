//
//  StationSelectionView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 07.09.2025.
//

import SwiftUI

struct StationSelectionView: View {
    let city: City
    @Binding var path: NavigationPath
    @Binding var selectedStation: Station?
    @State private var viewModel = StationSelectionViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.filteredStations, id: \.id) { station in
                CityAndStationCollectionItemView(text: station.name) {
                    selectedStation = station
                    path.removeLast(path.count)
                }
            }
        }
        .overlay {
            Text("Станция не найдена")
                .modifier(BoldTwentyFour())
                .foregroundColor(.ypBlack)
                .opacity(viewModel.filteredStations.isEmpty ? 1 : 0)
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
        .navigationBarBackButtonHidden()
        .toolbar {
            CustomBackToolbarView()
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .safeAreaInset(edge: .top) {
            Color.clear
                .frame(height: 0)
                .background(.ypWhite)
        }
        .onAppear {
            viewModel.loadStations(city: city)
        }
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    @Previewable @State var selectedStation: Station?
    StationSelectionView(city: City(id: 1, name: "Test"), path: $path, selectedStation: $selectedStation)
}
