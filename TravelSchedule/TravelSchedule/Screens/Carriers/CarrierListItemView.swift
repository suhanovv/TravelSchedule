//
//  CarrierListItemView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 08.09.2025.
//

import SwiftUI
import Kingfisher

struct CarrierListItemView: View {
    let carrier: CarrierListItem
    
    var body: some View {
        VStack(alignment: .leading) {
            topInfo
            bottomInfo
        }
        .frame(height: 104)
        .background(Rectangle()
            .fill(.ypLightGrey)
            .clipShape(.rect(cornerRadius: 24))
        )
        .background(.ypWhite)
    }
    
    private var topInfo: some View {
        HStack {
            KFImage.url(URL(string: carrier.logo))
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .scaledToFit()
                .frame(width: 38, height: 38)
                .clipShape(.rect(cornerRadius: 12))
            VStack(alignment: .leading) {
                HStack{
                    Text(carrier.name).modifier(RegularSeventeen())
                    
                    Spacer()
                    
                    Text(carrier.formattedStartDate).modifier(RegularTwelve())
                }
                .foregroundStyle(.ypBlackUniversal)
                
                if let transition = carrier.transition {
                    Text(transition)
                        .modifier(RegularTwelve())
                        .foregroundStyle(.ypRed)
                }
            }
        }
        .frame(height: 38)
        .padding(EdgeInsets(top: 14, leading: 14, bottom: 0, trailing: 7))
    }
    
    private var bottomInfo: some View {
        HStack{
            Text(carrier.formattedDepartureTime).modifier(RegularSeventeen())
            VStack { Divider().overlay(.ypGrey) }
            
            Spacer()
            
            Text(carrier.formattedDuration).modifier(RegularTwelve())
            
            VStack { Divider().overlay(.ypGrey) }
            
            Spacer()
            
            Text(carrier.formattedArrivalTime).modifier(RegularSeventeen())
                
        }
        .foregroundStyle(.ypBlackUniversal)
        .frame(height: 48)
        .padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14))
    }
}

#Preview {
    @Previewable @State var carrier = CarrierListItem(
        id: UUID(),
        name: "Русская Авиакомпания",
        logo: "https://yastat.net/s3/rasp/media/data/company/logo/gazpr.jpg",
        arrivalTime: Date(),
        departureTime: Date(),
        duration: .seconds(100000),
        startDate: Date(),
        transition: "С пересадкой в Костроме"
    )
    CarrierListItemView(carrier: carrier)
}
