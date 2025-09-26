//
//  CityAndStationCollectionItemView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.09.2025.
//

import SwiftUI

struct CityAndStationCollectionItemView: View {
    let text: String
    let onTap: () -> Void
    
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .onTapGesture {
            onTap()
        }
        .frame(height: 60)
        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 18))
        .tint(.ypBlack)
        .listRowBackground(Color.clear)
        .labelStyle(.titleOnly)
        .listRowSeparator(.hidden)
    }
}
