//
//  CarriersListView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 08.09.2025.
//

import SwiftUI

struct CarriersListView: View {
    @State var viewModel: CarriersListViewModel
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
            if (viewModel.carriers.isEmpty) {
                Text("Вариантов нет")
                    .modifier(BoldTwentyFour())
                    .foregroundColor(.ypBlack)
            }
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
            viewModel.loadData()
        }
    }
    
    private var title: some View {
        Text(viewModel.title)
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
                if viewModel.isAnyFilterActive() {
                    Circle()
                        .fill(.ypRed)
                        .frame(width: 8, height: 8)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(RoundedRectangle(cornerRadius: 16)
            .fill(.ypBlue))
        }
        .padding(.bottom, 24)
    }
}

#Preview {
    
    let carriersViewModel = CarriersListViewModel(
        searchParams: ScheduleSearchParams(from: Station(id: 1, name: "test"), to: Station(id: 2, name: "test")))
    
    CarriersListView(viewModel: carriersViewModel)
    
}

