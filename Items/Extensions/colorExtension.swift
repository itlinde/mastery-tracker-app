//
//  colorExtension.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-08-27.
//

import Foundation
import SwiftUI

// To use extension: Color[#] --> eg. Color[1] will return red
extension Color {
    static subscript(name: Int) -> Color {
        switch name {
        case 1:
            return Color.red1
        case 2:
            return Color.orange2
        case 3:
            return Color.yellow3
        case 4:
            return Color.green4
        case 5:
            return Color.green5
        case 6:
            return Color.green6
        default:
            return Color.backgroundshade.opacity(0.5)
        }
    }
}
