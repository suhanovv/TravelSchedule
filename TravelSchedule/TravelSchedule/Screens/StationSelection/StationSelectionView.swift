//
//  StationSelectionView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 07.09.2025.
//

import SwiftUI

struct StationSelectionView: View {
    @State var viewModel: StationSelectionViewModel
    @Environment(\.dismiss) private var dismiss
    @Binding var path: NavigationPath
    @Binding var selectedStation: Station?
    
    var body: some View {
        List {
            ForEach(viewModel.filteredStations, id: \.id) { station in
                HStack {
                    Text(station.name)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .frame(height: 60)
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 18))
                .tint(.ypBlack)
                .listRowBackground(Color.clear)
                .labelStyle(.titleOnly)
                .listRowSeparator(.hidden)
                .onTapGesture {
                    selectedStation = station
                    path.removeLast(path.count)
                }
            }
        }
        .overlay {
            if viewModel.filteredStations.isEmpty {
                Text("Станция не найдена")
                    .modifier(BoldTwentyFour())
                    .foregroundColor(.ypBlack)
            }
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
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.ypBlack)
                }
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .safeAreaInset(edge: .top) {
            Color.clear
                .frame(height: 0)
                .background(.ypWhite)
        }
        .onAppear {
            viewModel.loadStations()
        }
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    @Previewable @State var viewModel = StationSelectionViewModel(city: City(id: 1, name: "Test"))
    @Previewable @State var selectedStation: Station?
    StationSelectionView(viewModel: viewModel, path: $path, selectedStation: $selectedStation)
}
