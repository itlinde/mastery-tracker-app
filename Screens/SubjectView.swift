//
//  ContentView.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-07-26.
//

import SwiftUI
import SwiftData

struct SubjectView: View {
    @Environment(\.modelContext) var modelContext
    @Query var subjects: [Subject]
    @State private var path = [Subject]()
    @State private var showSplash = true
    
    var body: some View {
        ZStack {
            if showSplash {
                SplashScreenView()
                    .transition(.opacity)
                    .animation(.easeOut(duration: 1), value: showSplash)
            } else {
                NavigationStack(path: $path) {
                    VStack(spacing: 0) {
                        HStack {
                            Text("Subjects")
                                .font(.system(.largeTitle, design: .rounded))
                                .bold()
                            
                            Spacer()
                            
                            Button {
                                addSubject()
                                print("Add new subject")
                            } label: {
                                PlusButton()
                            }
                        }
                        .padding()
                        
                        Divider()
                        
                        List {
                            ForEach(subjects) { subject in
                                NavigationLink(value: subject) {
                                    Text(subject.name)
                                }
                            }
                            .onDelete(perform: deleteSubjects)
                        }
                        .listStyle(.plain)
                        .overlay {
                            if subjects.isEmpty {
                                ContentUnavailableView(label: {
                                    Label("No Subjects", systemImage: "list.bullet.rectangle.portrait")
                                }, description: {
                                    Text("Hit '+' to add a new subject.")
                                })
                                .offset(y: -60)
                            }
                        }
                    }
                    .navigationDestination(for: Subject.self) { subject in
                        SubjectDetailView(subject: subject)
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.showSplash = false
                }
            }
        }
    }
    
    func addSubject() {
        let subject = Subject()
        modelContext.insert(subject)
        path = [subject]
    }
    
    func deleteSubjects(_ indexSet: IndexSet) {
        for index in indexSet {
            let subject = subjects[index]
            modelContext.delete(subject)
        }
    }
}

#Preview { @MainActor in
    NavigationStack {
        SubjectView()
    }
    .modelContainer(previewContainer)
}
