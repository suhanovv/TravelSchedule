//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 12.09.2025.
//

import SwiftUI

struct ScheduleView: View {
    private let cornerRadius: CGFloat = 20
    @State private var viewModel: ViewModel
    @Environment(Coordinator.self) private var coordinator
    
    var body: some View {
        VStack(spacing: 16) {
            StoriesPreview(viewModel: .init(cards: viewModel.storiesCards))
            selectRouteWidget
            if let from = viewModel.from, let to = viewModel.to {
                
                Button(action: {
                    coordinator.push(.carriersList(from, to))
                }) {
                    Text("Найти")
                        .modifier(BoldSeventeen())
                        .frame(width: 150, height: 60)
                        .foregroundColor(.white)
                        .background(.ypBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
    private var selectRouteWidget: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading) {
                cityTextView(placeholder: "Откуда", value: viewModel.nameFrom) {
                    coordinator.push(.citySelection(.from))
                }
                cityTextView(placeholder: "Куда", value: viewModel.nameTo) {
                    coordinator.push(.citySelection(.to))
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
        .padding(16)
        .frame(height: 128)
        .background(RoundedRectangle(cornerRadius: cornerRadius).fill(.ypBlue))
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    private func cityTextView(placeholder: String, value: String?, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(value ?? placeholder)
                .modifier(RegularSeventeen())
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .lineLimit(1)
                .foregroundStyle((value != nil) ? .ypBlackUniversal : .ypGrey)
        }
    }
}


#Preview {
    @Previewable @State var routeModel = RouteModel()
    ScheduleView(viewModel: .init(route: routeModel))
}
