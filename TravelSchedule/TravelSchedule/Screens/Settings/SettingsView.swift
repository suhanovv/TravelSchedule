//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 10.09.2025.
//

import SwiftUI

struct SettingsView: View {
    @State private var viewModel = ViewModel()
    @Environment(Coordinator.self) private var coordinator
    
    var body: some View {
        VStack(alignment: .leading) {
            Toggle(isOn: $viewModel.isDarkMode) {
                Text("Темная тема")
                    .modifier(RegularSeventeen())
                    .foregroundStyle(.ypBlack)
            }
            .tint(.ypBlue)
            .frame(height: 60)
            Button(action: {coordinator.push(.licenseScreen)}) {
                HStack {
                    Text("Пользовательское соглашение")
                        .modifier(RegularSeventeen())
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
            Spacer()
            VStack(alignment: .center) {
                Text("Приложение использует API «Яндекс.Расписания»")
                Text("Версия 1.0 (beta)")
            }
            .modifier(RegularTwelve())
            .frame(maxWidth: .infinity)
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .foregroundStyle(.ypBlack)
    }
}


#Preview {
    SettingsView()
}
