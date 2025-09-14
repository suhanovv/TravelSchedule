//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 12.09.2025.
//

import SwiftUI

struct ScheduleView: View {
    private let cornerRadius: CGFloat = 20
    @State private var viewModel: ScheduleViewModel
    
    init(searchParams: ScheduleSearchParams) {
        viewModel = ScheduleViewModel(scheduleSearchParams: searchParams)
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            selectRouteWidget
            if viewModel.isFormValid {
                searchButton
            }
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
    private var selectRouteWidget: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading) {
                NavigationLink(value: NavigationRoute.citySelection(.from)) {
                    cityTextView(placeholder: "Откуда", value: viewModel.from)
                }
                NavigationLink(value: NavigationRoute.citySelection(.to)) {
                    cityTextView(placeholder: "Куда", value: viewModel.to)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 13))
            .frame(height: 96)
            .background(RoundedRectangle(cornerRadius: cornerRadius).fill(.ypWhiteUniversal))
            Button(action: viewModel.swapFromTo) {
                Image(systemName: "arrow.2.squarepath")
                    .foregroundStyle(.ypBlue)
                    .frame(width: 24, height: 24)
                    .padding(6)
                    .background(.ypWhiteUniversal)
                    .clipShape(Circle())
            }
            .frame(width: 36, height: 36)
        }
        .padding(.all, 16)
        .frame(height: 128)
        .background(RoundedRectangle(cornerRadius: cornerRadius).fill(.ypBlue))
    }
    
    private var searchButton: some View {
        NavigationLink(value: NavigationRoute.carriersList) {
            Text("Найти")
                .modifier(BoldSeventeen())
                .frame(width: 150, height: 60)
                .foregroundColor(.white)
                .background(.ypBlue)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
    
    private func cityTextView(placeholder: String, value: String?) -> some View {
        Text(value ?? placeholder)
            .modifier(RegularSeventeen())
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .lineLimit(1)
            .foregroundStyle((value != nil) ? .ypBlackUniversal : .ypGrey)
    }
}

#Preview {
    ScheduleView(searchParams: ScheduleSearchParams())
}
