//
//  Story.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 20.09.2025.
//

import Foundation

struct Story: Identifiable, Equatable {
    let id: Int
    let imagePriview: String
    let images: [String]
    let title: String
    let content: String
}

extension Story {
    static let stabStories: [Story] = [
        .init(id: 1, imagePriview: "StoryPreview1", images: ["Story1_1", "Story1_2"], title: "Text",content: "Text Text Text Text Text Text Text"),
        .init(id: 2, imagePriview: "StoryPreview2", images: ["Story2_1", "Story2_2"], title: "Поездка в Австралию", content: "Поездка в Австралию"),
        .init(id: 3, imagePriview: "StoryPreview3", images: ["Story3_1", "Story3_2"], title: "text", content: "Поездка в Австралию"),
        .init(id: 4, imagePriview: "StoryPreview4", images: ["Story4_1", "Story4_2"], title: "Поездка в Австралию", content: "Поездка в Австралию"),
        .init(id: 5, imagePriview: "StoryPreview5", images: ["Story5_1", "Story5_2"], title: "Поездка в Австралию", content: "Поездка в Австралию"),
        .init(id: 6, imagePriview: "StoryPreview6", images: ["Story6_1", "Story6_2"], title: "text", content: "Поездка в Австралию"),
        .init(id: 7, imagePriview: "StoryPreview7", images: ["Story7_1", "Story7_2"], title: "Поездка в Австралию", content: "Поездка в Австралию"),
        .init(id: 8, imagePriview: "StoryPreview8", images: ["Story8_1", "Story8_2"], title: "Поездка в Австралию", content: "Поездка в Австралию"),
        .init(id: 9, imagePriview: "StoryPreview9", images: ["Story9_1", "Story9_2"], title: "text", content: "Поездка в Австралию")
    ]
    
    static let oneStory: Story = stabStories.first!
        
}
