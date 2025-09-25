//
//  TravelScheduleApp.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.08.2025.
//

import SwiftUI

@main
struct TravelScheduleApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        
    }
}
