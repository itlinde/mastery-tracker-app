//
//  PlusButton.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-07-29.
//

import SwiftUI

struct PlusButton: View {
    var body: some View {
        Image(systemName: "plus")
            .resizable()
            .frame(width: 18, height: 18)
            .foregroundStyle(.textdim.opacity(0.8))
    }
}

#Preview {
    PlusButton()
}
