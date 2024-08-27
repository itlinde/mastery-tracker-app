//
//  TopicViewExpanded.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-07-29.
//

import SwiftUI

struct TopicViewExpanded: View {
    @State var showTimestampMenu: [Int: Bool] = [:]
    var isEditModeActive: Bool
    
    var subject: Subject
    var topic: Topic
    var width: CGFloat
    
    
    var body: some View {
        @Bindable var topic = topic
        
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                deleteTopicButton(subject: subject, topic: topic, isEditModeActive: isEditModeActive)
                
                TextField("new topic", text: $topic.title)
                    .submitLabel(.done)
                
                Spacer()
                
                newTimestampButton(showTimestampMenu: Binding(
                    get: { showTimestampMenu[0] ?? false },
                    set: { showTimestampMenu[0] = $0 }
                ), topic: topic)
            }
            .frame(width: width * 0.6)
                
            // time stamps
            ForEach(topic.dateReviewed.indices, id: \.self) { index in
                
                timestampButton(index: index)
                
                Divider()
            }
            
        }
        
        Divider()
    }
    
    // timestamp button
    @ViewBuilder
    func timestampButton(index: Int) -> some View {
        Button {
            showTimestampMenu[index] = true
        } label: {
            Text(topic.dateReviewed[index]?.displayFormat ?? "select date")
                .frame(width: 110, height: 45)
                .background(Color[topic.dateColor[index]])
                .foregroundStyle(topic.dateReviewed[index] != nil ? .textmain : .textdim)
        }
        .popover(isPresented: Binding(
            get: { showTimestampMenu[index] ?? false },
            set: { showTimestampMenu[index] = $0 }
        ), arrowEdge: .trailing) {
            TimestampMenu(topic: topic, index: index, timestamp: Binding(
                get: { topic.dateReviewed[index] },
                set: { topic.dateReviewed[index] = $0 }
            ), cellColor: Binding(
                get: { topic.dateColor[index] },
                set: { topic.dateColor[index] = $0 }
            ))
                .padding()
                .presentationCompactAdaptation(.popover)
        }
    }

}

#Preview {
    struct Preview: View {
        @State var isEditModeActive = true
        
        var body: some View {
            TopicViewExpanded(isEditModeActive: isEditModeActive, subject: Subject(name: "math"), topic: Topic(title: "integral", dateReviewed: [Date.now], dateColor: [0]), width: 300)
        }
    }
    return Preview()
}
