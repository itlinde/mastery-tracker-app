//
//  TimestampMenu.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-08-01.
//

import SwiftUI

struct TimestampMenu: View {
    var topic: Topic
    var index: Int
    
    @Binding var timestamp: Date?
    @Binding var cellColor: Int
    
    var colors: [Color] = [.red1, .orange2, .yellow3, .green4, .green5, .green6]
    
    var body: some View {
        VStack {
            // close timestamp menu 'x' buttom
//            HStack {
//                Spacer()
//                
//                Button {
//                    print("close timestamp menu")
//                } label: {
//                    Image(systemName: "x.circle")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .foregroundStyle(Color.textdim.opacity(0.5))
//                }
//            }
            
            DatePicker("Last reviewed:", selection: Binding(
                get: { timestamp ?? Date.now },
                set: { timestamp = $0 } // timestamp is updated with the value from the 1st parameter
            ), displayedComponents: [.date])
                .padding([.bottom], 3)
            
            Divider()
                .padding([.bottom], 7)
            
            Text("Understanding:")
                .padding([.leading, .trailing])
            
            HStack {
                
                ForEach(colors, id: \.self) { color in
                    Button {
                        print("change timestamp color")
                        
                        // change cell color depending on which button is tapped
                        switch color {
                        case .red1:
                            cellColor = 1
                            print("cellColor - red")
                        case .orange2:
                            cellColor = 2
                            print("cellColor - orange")
                        case .yellow3:
                            cellColor = 3
                            print("cellColor - yellow")
                        case .green4:
                            cellColor = 4
                            print("cellColor - green 4")
                        case .green5:
                            cellColor = 5
                            print("cellColor - green 5")
                        case .green6:
                            cellColor = 6
                            print("cellColor - green 6")
                        default:
                            cellColor = 0
                            print("cellColor - no change")
                        }
                        
                    } label: {
                        Circle()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(color)
                    }
                }
            }
            .padding([.leading, .trailing, .bottom], 5)
            
            Divider()
            
            Button {
                print("delete timestamp")
                deleteTimestamp(at: index)
            } label: {
                Label("Delete", systemImage: "trash")
                    .padding(.top, 5)
                    .foregroundStyle(index >= topic.dateReviewed.count - 1 ? .textdim.opacity(0.4) : .red)
            }
            .disabled(index >= topic.dateReviewed.count - 1)
            
        }
        .onAppear {
            if timestamp == nil {
                timestamp = Date.now
            }
        }
    }
    
    // delete a timestamp
    private func deleteTimestamp(at index: Int) {
        guard index < topic.dateReviewed.count else { return }
        topic.dateReviewed.remove(at: index)
        topic.dateColor.remove(at: index)
    }
}

#Preview {
    struct Preview: View {
        @State var timestamp: Date? = Date.now
        @State var cellColor: Int = 0
        
        var body: some View {
            TimestampMenu(topic: Topic(title: "math", dateReviewed: [Date.now], dateColor: [0]), index: 0, timestamp: $timestamp, cellColor: $cellColor)
        }
    }
    return Preview()
}
