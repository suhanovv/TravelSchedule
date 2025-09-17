//
//  ErrorView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 10.09.2025.
//

import SwiftUI

enum ErrorType {
    case noInternet
    case serverError
    
    var localizedDescription: String {
        switch self {
            case .noInternet: "Нет интернета"
            case .serverError: "Ошибка сервера"
        }
    }
    
    var logo: ImageResource {
        switch self {
            case .noInternet: .noInternet
            case .serverError: .serverError
        }
    }
}

struct ErrorView: View {
    var errorType: ErrorType
    
    var body: some View {
        VStack(spacing: 16) {
            Image(errorType.logo)
                .resizable()
                .frame(width: 223, height: 223)
            Text(errorType.localizedDescription)
                .modifier(BoldTwentyFour())
                .foregroundStyle(.ypBlack)
        }
    }
}

#Preview("Нет интернета") {
    ErrorView(errorType: ErrorType.noInternet)
}

#Preview("Ошибка сервера") {
    ErrorView(errorType: ErrorType.serverError)
}
