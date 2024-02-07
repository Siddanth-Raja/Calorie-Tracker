//
//  CircularProgressProteinView.swift
//  CalorieTracker
//
//  Created by Siddanth Raja on 2/6/24.
//

import SwiftUI

struct CircularProgressProteinView: View {
    var progress: Float // Current progress (amount of protein consumed)
    var total: Float // Total value for 100% progress (recommended daily protein intake)
    
    private var percentage: CGFloat {
        return CGFloat(progress / total)
    }

    var body: some View {
        VStack {
            ZStack {
                // Background Circle
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)

                // Progress Arc for Protein
                Circle()
                    .trim(from: 0.0, to: percentage)
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.green) // Consider changing the color to differentiate from calories
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear, value: percentage)

                // Percentage Text for Protein
                Text(String(format: "%.0f%%", percentage * 100))
                    .font(.largeTitle)
                    .bold()
            }
            .frame(width: 150, height: 150) // Adjust the size as needed

            // Label Text "Protein"
            Text("Protein")
                .font(.headline)
                .padding(.top, 5) // Adjust the spacing if necessary
        }
    }
}


#Preview {
    CircularProgressProteinView(progress: 20, total: 100)
}
