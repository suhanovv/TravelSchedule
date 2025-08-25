//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 23.08.2025.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    let testData = TestFetchData()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
//            testData.testFetchNearestStations()
//            testData.testFetchNearestCity()
//            testData.testFetchThreadStations()
//            testData.testFetchCarrier()
//            testData.testFetchCopyrightInfo()
//            testData.testFetchScheduleBetweenStations()
//            testData.testStationSchedule()
//            testData.testFetchAllStations()
        }
    }    
}

#Preview {
    ContentView()
}

