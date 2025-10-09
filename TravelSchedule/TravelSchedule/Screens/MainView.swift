//
//  MainView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.08.2025.
//

import SwiftUI

struct MainView: View {
    @Environment(Coordinator.self) private var coordinator

    var body: some View {

            TabView() {
                Group {
                    scheduleTabView
                    settingsTabView
                }
                .background(.ypWhite)
            }
            .tint(.ypBlack)
    }
    
    private var scheduleTabView: some View {
        VStack {
            coordinator.build(page: .schedule)
            Spacer()
            Divider()
        }
        .tabItem {
            Image(.scheduleIcon)
        }
    }
    private var settingsTabView: some View {
        VStack {
            coordinator.build(page: .settings)
            Spacer()
            Divider()
        }
        .tabItem {
            Image(.settingsIcon)
        }
    }
}

#Preview {
    MainView()
}
