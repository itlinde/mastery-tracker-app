//
//  SplashScreenView.swift
//  MasteryTracker2
//
//  Created by Isabella Linde on 2024-08-06.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        VStack {
            Image("trafficworm")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text("loading...")
                .font(.system(size: 24, design: .rounded))
                .bold()
        }
    }
}

#Preview {
    SplashScreenView()
}
