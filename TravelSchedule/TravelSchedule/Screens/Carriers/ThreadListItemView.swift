//
//  CarrierListItemView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 08.09.2025.
//

import SwiftUI
import Kingfisher


struct ThreadListItemView: View {
    let thread: ThreadListItem
    
    var body: some View {
        VStack(alignment: .leading) {
            TopInfoView(
                logo: thread.carrierInfo.logo,
                carrierName: thread.carrierInfo.name,
                startDate: thread.formattedStartDate,
                hasTransition: thread.hasTransition
            )
            BottomInfoView(
                departureTime: thread.departureTime,
                duration: thread.formattedDuration,
                arrivalTime: thread.arrivalTime
            )
        }
        .frame(height: 104)
        .background(Rectangle()
            .fill(.ypLightGrey)
            .clipShape(.rect(cornerRadius: 24))
        )
        .background(.ypWhite)
    }
}

fileprivate struct TopInfoView: View {
    let logo: String?
    let carrierName: String
    let startDate: String
    let hasTransition: Bool
    
    var body: some View {
        HStack {
            if let logo {
                KFImage.url(URL(string: logo))
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(width: 38, height: 38)
                    .clipShape(.rect(cornerRadius: 12))
            }
            VStack(alignment: .leading) {
                HStack{
                    Text(carrierName).modifier(RegularSeventeen())
                    Spacer()
                    Text(startDate).modifier(RegularTwelve())
                }
                .foregroundStyle(.ypBlackUniversal)
                
                if hasTransition {
                    Text("С пересадкой")
                        .modifier(RegularTwelve())
                        .foregroundStyle(.ypRed)
                }
            }
        }
        .frame(height: 38)
        .padding(EdgeInsets(top: 14, leading: 14, bottom: 0, trailing: 7))
    }
}

fileprivate struct BottomInfoView: View {
    let departureTime: String
    let duration: String
    let arrivalTime: String
    
    var body: some View {
        HStack{
            Text(departureTime).modifier(RegularSeventeen())
            VStack { Divider().overlay(.ypGrey) }
            Spacer()
            Text(duration).modifier(RegularTwelve())
            VStack { Divider().overlay(.ypGrey) }
            Spacer()
            Text(arrivalTime).modifier(RegularSeventeen())
        }
        .foregroundStyle(.ypBlackUniversal)
        .frame(height: 48)
        .padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14))
    }
}
