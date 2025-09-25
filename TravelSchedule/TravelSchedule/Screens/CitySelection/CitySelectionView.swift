//
//  CitySelectionView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 07.09.2025.
//

import SwiftUI


struct CitySelectionView: View {
    var routeDirectionType: RouteDirectionType
    @Binding var path: NavigationPath
    @State private var viewModel = CitySelectionViewModel()
    @State private var isSearch: Bool = false
    
    var body: some View {
        List {
            ForEach(viewModel.filteredCities) { city in
                CityAndStationCollectionItemView(text: city.name) {
                    isSearch = false
                    path.append(NavigationRoute.stationSelection(routeDirectionType, city))
                }
            }
        }
        .overlay {
            Text("Город не найден")
                .modifier(BoldTwentyFour())
                .foregroundColor(.ypBlack)
                .opacity(viewModel.filteredCities.isEmpty ? 1 : 0)
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
        .navigationBarBackButtonHidden()
        .toolbar {
            CustomBackToolbalView()
        }
        .toolbarBackground(Color.ypWhite, for: .navigationBar)
        .onAppear {
            viewModel.loadCities()
        }
    }
}

#Preview {
    @Previewable @State var path: NavigationPath = NavigationPath()
    CitySelectionView(routeDirectionType: RouteDirectionType.from, path: $path)
}
