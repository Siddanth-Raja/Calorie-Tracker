//
//  LoadingView.swift
//  CalorieTracker
//
//  Created by Siddanth Raja on 2/5/24.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isActive: Bool
    @State private var userInput: String = ""

    var body: some View {
        VStack {
            Text("Calorie Tracker")
                .font(.largeTitle)
                .padding()

            TextField("What's on your mind today?", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                self.isActive = true
            }) {
                Text("Continue")
                    .fontWeight(.semibold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(40)
                    .padding(.horizontal)
            }
            
            Button(action: {
                self.isActive = true
            }) {
                Text("Skip")
                    .fontWeight(.semibold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(40)
                    .padding(.horizontal)
            }
        }
    }
}




