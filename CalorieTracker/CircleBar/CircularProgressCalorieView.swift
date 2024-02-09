//
//  CircularProgressView.swift
//  CalorieTracker
//
//  Created by Siddanth Raja on 2/6/24.
//

import SwiftUI

struct CircularProgressCalorieView: View {
    var progress: Float // Current progress
    var total: Float // Total value for 100% progress
    
    private var percentage: CGFloat {
        return CGFloat(progress / total)
    }

    var body: some View {
        VStack { //
            ZStack {
                // Background Circle
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)

                // Progress Arc
                Circle()
                    .trim(from: 0.0, to: percentage)
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.blue)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear, value: percentage)

                // Percentage Text
                Text(String(format: "%.0f%%", percentage * 100))
                    .font(.largeTitle)
                    .bold()
            }
            .frame(width: 150, height: 150) // Set the frame for the circular progress
            
            // Label Text "Calories"
            Text("Calories")
                .font(.headline) // font style
                .padding(.top, 5) // spacing (optional)
        }
    }
}
