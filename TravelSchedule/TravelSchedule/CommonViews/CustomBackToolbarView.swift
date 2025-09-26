//
//  CustomBackToolbalView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.09.2025.
//

import SwiftUI

struct CustomBackToolbarView: ToolbarContent {
    @Environment(\.dismiss) private var dismiss
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(action: { dismiss() }) {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.ypBlack)
            }
        }
    }
}
