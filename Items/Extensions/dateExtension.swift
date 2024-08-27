//
//  dateExtension.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-08-27.
//

import Foundation
import SwiftUI

// gives the Date type a formatting extension
extension Date {
    var displayFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
}
