//
//  deleteTopicButton.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-08-06.
//

import SwiftUI

struct deleteTopicButton: View {
    var subject: Subject
    var topic: Topic
    var isEditModeActive: Bool
    
    var body: some View {
        Button(role: .destructive) {
            print("topic '\(topic.title)' removed")
            subject.topics.removeAll(where: { $0.id == topic.id } )
            
        } label: {
            Image(systemName: "minus.circle")
                .resizable()
                .frame(width: isEditModeActive ? 20 : 0, height: isEditModeActive ? 20 : 0)
        }
        .padding(.trailing, isEditModeActive ? 15 : 0)
    }
}

#Preview {
    deleteTopicButton(subject: Subject(name: "math"), topic: Topic(title: "integral", dateReviewed: [Date.now], dateColor: [0]), isEditModeActive: true)
}
