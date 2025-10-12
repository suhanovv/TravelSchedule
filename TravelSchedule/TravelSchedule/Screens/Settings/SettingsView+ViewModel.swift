//
//  ViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 04.10.2025.
//

import SwiftUI

extension SettingsView {
    @Observable @MainActor
    final class ViewModel {
        var isDarkMode = false {
            didSet {
                UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
            }
        }
        
        init() {
            self.isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        }
        
    }
}
