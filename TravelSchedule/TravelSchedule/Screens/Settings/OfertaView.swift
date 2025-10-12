//
//  LicenseView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 22.09.2025.
//

import SwiftUI

struct OfertaView: View {
    @Environment(Coordinator.self) private var coordinator
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(OfertaData.header)
                        .modifier(BoldTwentyFour())
                    Text(OfertaData.rules)
                        .modifier(RegularSeventeen())
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text(OfertaData.termsHeader)
                        .modifier(BoldTwentyFour())
                    Text(OfertaData.termsBody)
                        .modifier(RegularSeventeen())
                }
            }
            .padding([.top, .horizontal], 16)
        }
        .background(Color.ypWhite)
        .navigationTitle("Пользовательское соглашение")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            CustomBackToolbarView()
        }
    }
}

#Preview {
    OfertaView()
}
