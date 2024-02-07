//
//  CalorieTrackerApp.swift
//  CalorieTracker
//
//  Created by Siddanth Raja on 2/5/24.
//

import SwiftUI

@main
struct CalorieTrackerApp: App {
    @State private var isActive = false

    var body: some Scene {
        WindowGroup {
            if isActive {
                DailyIntakeView()
            } else {
                LoadingView(isActive: $isActive)
            }
        }
    }
}

