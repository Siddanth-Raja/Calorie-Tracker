//
//  LoadingView.swift
//  CalorieTracker
//
//  Created by Siddanth Raja on 2/5/24.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isActive: Bool  // Accepts a binding to the isActive state
    @State private var selection: Emoji = .happy // Default selection

    var body: some View {
        VStack {
            Text("Calorie Tracker")
                .font(.largeTitle)
                .padding()

            Text("How are you doing today?")
                .font(.headline)
                .padding()

            Text(selection.rawValue)
                .font(.system(size: 150))

            Picker("Select Emoji", selection: $selection) {
                ForEach(Emoji.allCases, id: \.self) { emoji in
                    Text(emoji.rawValue)
                }
            }
            .pickerStyle(.segmented)

            Spacer() // Pushes everything to the top

            Button("Continue") {
                self.isActive = true // Updates isActive to true, triggering the navigation
            }
            .font(.headline)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.bottom, 20) // Adds padding at the bottom

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

// Emoji enum for picker options
enum Emoji: String, CaseIterable {
    case happy = "😁"
    case okay = "😐"
    case sad = "😔"
    case angry = "😡"
    // Add more emojis if needed
}
