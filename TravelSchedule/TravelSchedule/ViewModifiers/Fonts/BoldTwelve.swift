//
//  RegularTwelve.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 07.09.2025.
//

import SwiftUI

struct BoldTwelve: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .bold, design: .default))
    }
}
