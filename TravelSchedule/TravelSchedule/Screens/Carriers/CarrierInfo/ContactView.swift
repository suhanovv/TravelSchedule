//
//  ContactView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.09.2025.
//

import SwiftUI

struct ContactView: View {
    let contactName: String
    let contactValue: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(contactName)
                .modifier(RegularSeventeen())
                .foregroundStyle(.ypBlack)
            Text(contactValue)
                .modifier(RegularTwelve())
                .foregroundStyle(.ypBlue)
        }
        .frame(height: 60)
    }
}

#Preview {
    ContactView(contactName: "E-mail", contactValue: "info@example.com")
}
