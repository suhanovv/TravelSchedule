//
//  CarrierInfoView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 09.09.2025.
//

import SwiftUI
import Kingfisher

struct CarrierInfoView: View {
    let carrier: CarrierInfo
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage.url(URL(string: carrier.logo))
                .placeholder { ProgressView() }
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 104, alignment: .center)
            Text(carrier.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .modifier(BoldTwentyFour())
                .foregroundStyle(.ypBlack)
            if let email = carrier.email {
                ContactView(contactName: "E-mail", contactValue: email)
            }
            if let phone = carrier.phone, !phone.isEmpty {
                ContactView(contactName: "Телефон", contactValue: phone)
            }
            Spacer()
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(.ypWhite)
        .navigationBarTitle("Информация о перевозчике")
        .navigationBarBackButtonHidden()
        .toolbar {
            CustomBackToolbalView()
        }
    }
}

#Preview {
    @Previewable @State var carrier = CarrierInfo(code: 8565, name: "Русская Авиакомпания", logo: "https://yastat.net/s3/rasp/media/data/company/logo/gazpr.jpg", email: nil, phone: "")
    CarrierInfoView(carrier: carrier)
}
