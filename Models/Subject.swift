//
//  Subject.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-07-29.
//

import Foundation
import SwiftData

@Model
class Subject {
    @Attribute(.unique) var name: String
    
//    @Relationship(deleteRule: .cascade)
    var topics: [Topic] = []
    
    init(name: String = "") {
        self.name = name
    }
}
