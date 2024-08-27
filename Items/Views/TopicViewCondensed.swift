//
//  TopicViewCondensed.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-07-27.
//

import SwiftUI

struct TopicViewCondensed: View {
    @State var showTimestampMenu = false
    
    var subject: Subject
    var topic: Topic
    var width: CGFloat
    var isEditModeActive: Bool
    
    var body: some View {
        @Bindable var topic = topic
        
        HStack(spacing: 0) {
            deleteTopicButton(subject: subject, topic: topic, isEditModeActive: isEditModeActive)
            
            TextField("new topic", text: $topic.title)
                .submitLabel(.done)
            
            Spacer()
            
            newTimestampButton(showTimestampMenu: $showTimestampMenu, topic: topic)
            
            timestampButton()
            
        }
        .frame(width: width)
        
        Divider()
    }
    
    @ViewBuilder
    func timestampButton() -> some View {
        Button {
            showTimestampMenu.toggle()
        } label: {
            if let timestamp = topic.dateReviewed.first {
                Text(timestamp?.displayFormat ?? "select date")
                    .frame(width: 110, height: 45)
                    .background(Color[topic.dateColor.first ?? 0])
                    .foregroundStyle(timestamp != nil ? .textmain : .textdim)
            } else {
                Text("ERROR")
            }
        }
        .popover(isPresented: $showTimestampMenu, arrowEdge: .bottom) {
            TimestampMenu(topic: topic, index: 0, timestamp: Binding(
                get: { topic.dateReviewed.first ?? nil },
                set: { topic.dateReviewed[0] = $0 }
            ),
            cellColor: Binding(
                get: { topic.dateColor.first ?? 0 },
                set: { topic.dateColor[0] = $0 }
            ))
                .padding()
                .presentationCompactAdaptation(.popover)
        }
    }
    
}

#Preview {
    struct Preview: View {
        @State var showTimestampMenu = false
        
        var body: some View {
            TopicViewCondensed(subject: Subject(name: "math"), topic: Topic(title: "integral", dateReviewed: [Date.now], dateColor: [0]), width: 350, isEditModeActive: false)
        }
        
    }
    
    return Preview()
}

