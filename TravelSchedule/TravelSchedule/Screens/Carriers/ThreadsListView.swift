//
//  CarriersListView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 08.09.2025.
//

import SwiftUI

struct ThreadsListView: View {
    let from: Station
    let to: Station
    @Binding var filterModel: ThreadFilterModel
    @Binding var path: NavigationPath
    @State private var viewModel: ThreadListViewModel = .init()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.makeTitle(from: from, to: to))
                    .modifier(BoldTwentyFour())
                    .foregroundStyle(.ypBlack)
                
                List(viewModel.threads, id: \.self) { thread in
                    ThreadListItemView(thread: thread)
                        .onTapGesture {
                            path.append(NavigationRoute.carrierInfo(thread.carrierInfo))
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
            
            ThreadFilterButton(isAnyFilterActive: filterModel.isAnyFilterActive)
        }
        .overlay {
            Text("Вариантов нет")
                .modifier(BoldTwentyFour())
                .foregroundColor(.ypBlack)
                .opacity(viewModel.threads.isEmpty ? 1 : 0)
        }
        .padding([.horizontal, .top], 16)
        .background(.ypWhite)
        .navigationBarBackButtonHidden()
        .toolbar {
            CustomBackToolbarView()
        }
        .onAppear {
            viewModel.loadData(from: from, to: to)
        }
    }
}

#Preview {
    
    @Previewable @State var filterModel: ThreadFilterModel = .init()
    ThreadsListView(
        from: Station(id: 1, name: "test"),
        to: Station(id: 2, name: "test"),
        filterModel: $filterModel,
        path: .constant(NavigationPath())
    )
}

