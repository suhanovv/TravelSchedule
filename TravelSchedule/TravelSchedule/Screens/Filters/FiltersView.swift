//
//  FiltersView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 09.09.2025.
//

import SwiftUI

struct FiltersView: View {
    @State private var viewModel: FilterViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(viewModel: FilterViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section(header: timeFiltersHeader) {
                    timeFilters
                }
                Section(header: transitionFiltersHeader) {
                    transitionFilters
                }
            }
            .formStyle(.columns)
            Spacer()
            acceptButton
        }
        .safeAreaPadding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16))
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
    }
    
    private var timeFiltersHeader: some View {
        Text("Время отправления")
            .modifier(BoldTwentyFour())
            .foregroundStyle(.ypBlack)
    }
    
    private var timeFilters: some View {
        ForEach(TimeFilterType.allCases, id: \.rawValue) { timeType in
            HStack {
                Text(timeType.rawValue)
                Spacer()
                Button(action: {
                    viewModel.changeTimeFilter(timeType)
                }) {
                    Image(systemName: viewModel.selectedTimes.contains(timeType) ? "checkmark.square.fill" : "square")
                        .foregroundStyle(.ypBlack)
                        .frame(width: 20, height: 20)
                    
                }
            }.frame(height: 60)
        }
    }
    
    private var transitionFiltersHeader: some View {
        Text("Показывать варианты с пересадками")
            .modifier(BoldTwentyFour())
            .foregroundStyle(.ypBlack)
    }
    
    private var transitionFilters: some View {
        ForEach(WithTransitionsOption.allCases, id: \.rawValue) { transition in
            HStack {
                Text(transition.rawValue)
                Spacer()
                Button(action: {
                    viewModel.changeTransitions(transition)
                }) {
                    Image(systemName: viewModel.selectedTransitions == transition ? "circle.inset.filled" : "circle")
                        .foregroundStyle(.ypBlack)
                        .frame(width: 20, height: 20)
                }
            }.frame(height: 60)
        }
    }
    
    private var acceptButton: some View {
        Button("Применить", action: {
            viewModel.apply()
            dismiss()
        })
        .modifier(BoldSeventeen())
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: 60)
        .background(RoundedRectangle(cornerRadius: 16)
        .fill(.ypBlue))
    }
}

#Preview {
    let model = FilterViewModel(searchParams: ScheduleSearchParams())
    FiltersView(viewModel: model)
}
