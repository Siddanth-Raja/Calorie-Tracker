//
//  FoodItem.swift
//  CalorieTracker
//
//  Created by Siddanth Raja on 2/5/24.
//

import Foundation

struct FoodItem: Identifiable {
    var id = UUID()
    var name: String
    var calories: Int
    var carbs: Double
    var protein: Double
    var fat: Double
}
