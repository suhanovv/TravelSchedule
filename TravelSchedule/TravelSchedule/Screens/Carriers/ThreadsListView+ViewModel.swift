//
//  ThreadsListView+ViewModel.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 08.09.2025.
//

import Foundation

struct CarrierInfo: Hashable {
    let code: Int
    let name: String
    let logo: String?
    let email: String?
    let phone: String?
}


struct ThreadListItem: Identifiable, Hashable {
    let id: String
    let carrierInfo: CarrierInfo
    let arrivalTime: String
    let departureTime: String
    let duration: Duration
    let startDate: Date
    let hasTransition: Bool
    
    var formattedDuration: String {
        duration.formatted(.units(allowed: [.hours], width: .wide))
    }
    
    var formattedStartDate: String {
        startDate.carriersListItemDateString
    }
}

extension ThreadsListView {
    @Observable @MainActor 
    final class ViewModel {
        private let from : Station
        private let to: Station
        private let apiClient: ApiClient
        private var threads: [ThreadListItem] = []
        var viewState: ViewState = .initial
        var filterModel: ThreadFilterModel
        var filteredThreads: [ThreadListItem] {
            applyFilter().sorted { $0.formattedStartDate < $1.formattedStartDate }
        }
        var title: String {
            "\(from.title) → \(to.title)"
        }
        
        var isFilterActive: Bool {
            filterModel.isAnyFilterActive
        }
        
        var progressBarVisible: Bool {
            viewState == .loading
        }
        
        var notFoundVisible: Bool {
            viewState == .loaded && filteredThreads.isEmpty
        }
        
        init(from: Station, to: Station, filterModel: ThreadFilterModel, apiClient: ApiClient) {
            self.from = from
            self.to = to
            self.filterModel = filterModel
            self.apiClient = apiClient
        }
        
        func loadData() async {
            var hasTransfers = false
            if
                let selectedTransitions = filterModel.selectedTransitions,
                    selectedTransitions == WithTransitionsOption.yes
            {
                hasTransfers = true
            }
            
            do {
                viewState = .loading
                let result = try await apiClient.getSchedule(
                    from: from.id,
                    to: to.id,
                    hasTransfers: hasTransfers
                )
                
                threads = mapSchedule(result)
                viewState = .loaded
            } catch {
                viewState = .error(.serverError)
            }
        }
        
        private func mapSchedule(_ schedule: Schedule) -> [ThreadListItem] {
            if let segments = schedule.segments {
                return segments.compactMap { segment in
                    if
                        let thread = segment.thread,
                        let threadUid = thread.uid,
                        let carrier = thread.carrier,
                        let carrierCode = carrier.code,
                        let carrierTitle = carrier.title,
                        let segmentArrival = segment.arrival,
                        let segmentDeparture = segment.departure,
                        let segmentDuration = segment.duration,
                        let segmentStartDate = segment.start_date,
                        let segmentStartDateDt = Date.threadStartDateFormatter.date(from: segmentStartDate)        
                    {
                        return ThreadListItem(
                            id: threadUid,
                            carrierInfo: CarrierInfo(
                                code: carrierCode,
                                name: carrierTitle,
                                logo: carrier.logo,
                                email: carrier.email,
                                phone: carrier.phone
                            ),
                            arrivalTime: String(segmentArrival.prefix(5)),
                            departureTime: String(segmentDeparture.prefix(5)),
                            duration: Duration.seconds(segmentDuration),
                            startDate: segmentStartDateDt,
                            hasTransition: segment.has_transfers ?? false
                        )
                    } else { return nil }
                    
                }
            } else {return []}
        }
        
        func applyFilter() -> [ThreadListItem] {
            if filterModel.selectedTimes.isEmpty  {
                return threads
            }
            return threads.filter { thread in
                if let arrivalHour = Int(thread.departureTime.prefix(2)) {
                    return filterModel.selectedTimes.first(where: { $0.timeRange.contains(arrivalHour) }) != nil
                }
                return false
            }
            
        }
        
    }
}
