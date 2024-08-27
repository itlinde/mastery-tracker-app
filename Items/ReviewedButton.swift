//
//  ReviewedButton.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-07-29.
//

import SwiftUI

struct ReviewedButton: View {
    var body: some View {
        Button {
            print("time is pressed")
        } label: {
            Text("11/03/24")
                .frame(width: 100, height: 35)
                .background(.backgroundshade.opacity(0.4))
                .foregroundStyle(.textmain)
                .clipShape(RoundedRectangle(cornerRadius: 7))
        }
    }
}

#Preview {
    ReviewedButton()
}
