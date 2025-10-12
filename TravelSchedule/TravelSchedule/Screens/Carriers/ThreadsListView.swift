//
//  ThreadsListView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 08.09.2025.
//

import SwiftUI

struct ThreadsListView: View {
    @Environment(Coordinator.self) private var coordinator
    @State private var viewModel: ViewModel
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.title)
                    .modifier(BoldTwentyFour())
                    .foregroundStyle(.ypBlack)
                
                List(viewModel.filteredThreads, id: \.self) { thread in
                    ThreadListItemView(thread: thread)
                        .onTapGesture {
                            coordinator.push(.carrierInfo(thread.carrierInfo))
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
            
            ThreadFilterButton(isAnyFilterActive: viewModel.isFilterActive) {
                coordinator.push(.filterScreen)
            }
        }
        .overlay {
            ProgressView().opacity(viewModel.progressBarVisible ? 1 : 0)
            Text("Вариантов нет")
                .modifier(BoldTwentyFour())
                .foregroundColor(.ypBlack)
                .opacity(viewModel.notFoundVisible ? 1 : 0)
        }
        .padding([.horizontal, .top], 16)
        .background(.ypWhite)
        
        .toolbar {
            CustomBackToolbarView()
        }
        .task {
            await viewModel.loadData()
        }
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}
