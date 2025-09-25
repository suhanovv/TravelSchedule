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
                ZStack {
                    HStack {
                        Text(city.name)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .onTapGesture {
                        isSearch = false
                        path.append(NavigationRoute.stationSelection(
                            routeDirectionType, city))
                    }
                }
                .frame(height: 60)
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 18))
                .tint(.ypBlack)
                .listRowBackground(Color.clear)
                .labelStyle(.titleOnly)
                .listRowSeparator(.hidden)
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
            ToolbarItem(placement: .topBarLeading) {
                Button(action:{ path.removeLast() }) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.ypBlack)
                }
            }
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
