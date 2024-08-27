//
//  MasteryTracker2App.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-07-26.
//

import SwiftUI
import SwiftData

@main
struct MasteryTracker2App: App {
    var body: some Scene {
        WindowGroup {
            SubjectView()
        }
        .modelContainer(for: Subject.self)
    }
}
