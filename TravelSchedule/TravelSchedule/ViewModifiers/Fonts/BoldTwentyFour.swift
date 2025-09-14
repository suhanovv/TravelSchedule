//
//  RegularTwelve.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 07.09.2025.
//

import SwiftUI

struct BoldTwentyFour: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .bold, design: .default))
    }
}
