//
//  Topic.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-07-29.
//

import Foundation
import SwiftData

@Model
class Topic {
    
    var title: String
    var dateReviewed: [Date?]
    var dateColor: [Int]
    
    var subject: Subject? // refers to the subject this topic belongs to
    
    init(title: String, dateReviewed: [Date?], dateColor: [Int], subject: Subject? = nil) {
        self.title = title
        self.dateReviewed = dateReviewed
        self.dateColor = dateColor
        self.subject = subject
    }
}
