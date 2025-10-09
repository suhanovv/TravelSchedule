//
//  NavigationView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 04.10.2025.
//

import SwiftUI

struct NavigationView: View {
    @State private var coordinator = Coordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .mainScreen)
                .navigationDestination(for: Pages.self) { page in
                    coordinator.build(page: page)
                        .navigationBarBackButtonHidden()
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { cover in
                    coordinator.build(cover: cover)
                    
                }
        }
        .environment(coordinator)
    }
}

#Preview {
    NavigationView()
}
