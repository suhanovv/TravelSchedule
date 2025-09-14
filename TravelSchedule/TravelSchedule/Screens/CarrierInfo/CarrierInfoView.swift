//
//  CarrierInfoView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 09.09.2025.
//

import SwiftUI
import Kingfisher

struct CarrierInfoView: View {
    var carrier: CarrierListItem
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            KFImage.url(URL(string: carrier.logo))
                .placeholder { ProgressView() }
                .resizable()
                .scaledToFit()
                .frame(height: 104)
            Text(carrier.name)
                .modifier(BoldTwentyFour())
                .foregroundStyle(.ypBlack)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.ypWhite)
        .navigationBarTitle("Информация о перевозчике")
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
}

#Preview {
    @Previewable @State var carrier = CarrierListItem(
        id: UUID(),
        name: "Русская Авиакомпания",
        logo: "https://yastat.net/s3/rasp/media/data/company/logo/gazpr.jpg",
        arrivalTime: Date(),
        departureTime: Date(),
        duration: .seconds(10000),
        startDate: Date(),
        transition: "С пересадкой в костроме"
        )
    CarrierInfoView(carrier: carrier)
}
