//
//  RegularTwelve.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 07.09.2025.
//

import SwiftUI

struct BoldSeventeen: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .bold, design: .default))
    }
}
