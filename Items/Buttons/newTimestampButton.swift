//
//  newTimestampButton.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-08-01.
//

import SwiftUI

struct newTimestampButton: View {
    @Binding var showTimestampMenu: Bool
    var topic: Topic
    
    var body: some View {
        Button {
            print("add new timestamp")
            
            topic.dateReviewed.insert(Date.now, at: 0)
            topic.dateColor.insert(0, at: 0)
            
            
            showTimestampMenu = true
            
        } label: {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundStyle(.textdim.opacity(0.2))
                .padding(.trailing, 15)
        }
    }
}

#Preview {
    struct Preview: View {
        @State var showTimestampMenu = false
        
        var body: some View {
            newTimestampButton(showTimestampMenu: $showTimestampMenu, topic: Topic(title: "integral", dateReviewed: [Date.now], dateColor: [0]))
        }
    }
    
    return Preview()
}
