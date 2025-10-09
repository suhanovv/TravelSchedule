//
//  CustomBackToolbalView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.09.2025.
//

import SwiftUI

struct CustomBackToolbarView: ToolbarContent {
    @Environment(Coordinator.self) private var coordinator
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(action: coordinator.pop) {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.ypBlack)
            }
        }
    }
}
