//
//  CarriersListView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 08.09.2025.
//

import SwiftUI

struct CarriersListView: View {
    let from: Station
    let to: Station
    @Binding var filterModel: CarriersFilterModel
    @State private var viewModel: CarriersListViewModel = .init()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16) {
                title
                listOfCarriers
            }
            filterButton
        }
        .overlay {
            Text("Вариантов нет")
                .modifier(BoldTwentyFour())
                .foregroundColor(.ypBlack)
                .opacity(viewModel.carriers.isEmpty ? 1 : 0)
        }
        .padding([.horizontal, .top], 16)
        .background(.ypWhite)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.ypBlack)
                }
            }
        }
        .onAppear {
            viewModel.loadData(from: from, to: to)
        }
    }
    
    private var title: some View {
        Text(viewModel.makeTitle(from: from, to: to))
            .modifier(BoldTwentyFour())
            .foregroundStyle(.ypBlack)
    }
    
    private var listOfCarriers: some View {
        List(viewModel.carriers, id: \.self) { carrier in
            ZStack {
                NavigationLink(value: NavigationRoute.carrierInfo(carrier)) {}
                    .opacity(0)
                CarrierListItemView(carrier: carrier)
                    
            }
            .background(.ypWhite)
            .listRowSeparator(.hidden)
            .listRowBackground(Color.ypWhite)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
            
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .scrollBounceBehavior(.basedOnSize)
    }
    
    private var filterButton: some View {
        NavigationLink(value: NavigationRoute.filterScreen) {
            HStack(spacing: 4) {
                Text("Уточнить время")
                    .modifier(BoldSeventeen())
                    .foregroundColor(.white)
                Circle()
                    .fill(.ypRed)
                    .frame(width: 8, height: 8)
                    .opacity(filterModel.isAnyFilterActive ? 1 : 0)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(RoundedRectangle(cornerRadius: 16)
            .fill(.ypBlue))
        }
        .padding(.bottom, 24)
    }
}

#Preview {
    
    @Previewable @State var filterModel: CarriersFilterModel = .init()
    CarriersListView(from: Station(id: 1, name: "test"), to: Station(id: 2, name: "test"), filterModel: $filterModel)
}

