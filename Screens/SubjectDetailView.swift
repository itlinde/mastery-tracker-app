//
//  SubjectDetailView.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-07-26.
//

import SwiftUI
import SwiftData

struct SubjectDetailView: View {
    let subject: Subject
    @State var isTopicViewExpanded = false
    @State var isEditModeActive = false
    
    var test: Set = [1, 2, 3]
    
    var body: some View {
        @Bindable var subject = subject
        
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center) {
                TextField("Subject", text: $subject.name)
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .submitLabel(.done)
                
                Spacer()
            }
            .padding([.leading, .trailing, .bottom], 25)
            
            HStack {
                Text("Topics")
                    .bold()
                
                Spacer()
                
                HStack {
                    Button {
                        isTopicViewExpanded.toggle()
                    } label: {
                        Label("Expand", systemImage: isTopicViewExpanded ? "arrow.up.forward.and.arrow.down.backward" : "arrow.down.backward.and.arrow.up.forward")
                            .labelStyle(.iconOnly)
                            .foregroundStyle(.textdim.opacity(0.5))
                    }
                    
                    Text("Last Reviewed")
                }
            }
            .padding([.leading, .trailing, .bottom])
            
            Divider()
            
            GeometryReader { geo in
                ScrollView {
                    if isTopicViewExpanded {
                        ScrollView(.horizontal) {
                            VStack(alignment: .leading, spacing: 0) {
                                ForEach(subject.topics) { topic in
                                    TopicViewExpanded(isEditModeActive: isEditModeActive, subject: subject, topic: topic, width: geo.size.width)
                                    
                                }
                            }
                        }
                    } else {
                        LazyVStack(spacing: 0) {
                            ForEach(subject.topics) { topic in
                                TopicViewCondensed(subject: subject, topic: topic,
                                                   width: geo.size.width, isEditModeActive: isEditModeActive)
                            }
                        }
                    }
                }
                .overlay {
                    if subject.topics.isEmpty {
                        ContentUnavailableView(label: {
                            Label("No Topics", systemImage: "list.bullet.rectangle.portrait")
                        }, description: {
                            Text("Hit '+' to add a new topic.")
                        })
                        .offset(y: -60)
                    }
                }
            }
            .padding(.leading)
            
            Spacer()
        }
        .ignoresSafeArea(edges: .bottom)
        .toolbar {
            ToolbarItemGroup {
                Button(role: .destructive) {
                    print("clear all")
                    subject.topics.removeAll()
                    isEditModeActive = false
                } label: {
                    (Text("Clear All"))
                        .foregroundStyle(.red.opacity(isEditModeActive ? 0.8 : 0))
                    
                }
                .padding(.trailing, 10)
                
                Button {
                    isEditModeActive.toggle()
                    print("edit button pressed")
                } label: {
                    Text(isEditModeActive ? "Done" : "Edit")
                        .foregroundStyle(.textdim.opacity(0.8))
                }
                .padding(.trailing, 10)
                
                Button {
                    addTopic()
                } label: {
                    PlusButton()
                }
            }
        }
    }
    
    private func addTopic() {
        print("topic added")
        let topic = Topic(title: "", dateReviewed: [nil], dateColor: [0])
        subject.topics.append(topic)
        print(subject.topics.last?.title ?? "nothing")
        
        for topic in subject.topics {
            print("topics: \(topic.title)")
        }
    }
}

// SubjectDetailViewContainer -- helps preview run using the data model
struct SubjectDetailViewContainer: View {
    @Query private var subjects: [Subject]
    
    var body: some View {
        SubjectDetailView(subject: subjects[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        SubjectDetailViewContainer()
    }.modelContainer(previewContainer)
}
