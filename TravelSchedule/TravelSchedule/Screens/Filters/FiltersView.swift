//
//  FiltersView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 09.09.2025.
//

import SwiftUI

struct FiltersView: View {
    @Binding var filterModel: ThreadFilterModel
    @State private var localFilterModel: ThreadFilterModel = .init()
    @State private var viewModel: FiltersViewModel = .init()
    @Environment(\.dismiss) private var dismiss

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
                .opacity(viewModel.isFiltersChanged(localState: filterModel, globalState: localFilterModel) ? 1 : 0)
        }
        .safeAreaPadding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16))
        .background(.ypWhite)
        .navigationBarBackButtonHidden()
        .toolbar {
            CustomBackToolbarView()
        }
        .onAppear {
            localFilterModel.selectedTimes = filterModel.selectedTimes
            localFilterModel.selectedTransitions = filterModel.selectedTransitions
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
                    localFilterModel.changeTimeFilter(timeType)
                }) {
                    Image(systemName: localFilterModel.selectedTimes.contains(timeType) ? "checkmark.square.fill" : "square")
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
                    localFilterModel.changeTransitions(transition)
                }) {
                    Image(systemName: localFilterModel.selectedTransitions == transition ? "circle.inset.filled" : "circle")
                        .foregroundStyle(.ypBlack)
                        .frame(width: 20, height: 20)
                }
            }.frame(height: 60)
        }
    }
    
    private var acceptButton: some View {
        Button("Применить", action: {
            filterModel = localFilterModel
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
    @Previewable @State var model = ThreadFilterModel()
    FiltersView(filterModel: $model)
}
