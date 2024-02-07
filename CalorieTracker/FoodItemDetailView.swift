//
//  FoodItemDetailView.swift
//  CalorieTracker
//
//  Created by Siddanth Raja on 2/5/24.
//

import Foundation
import SwiftUI

struct FoodItemDetailView: View {
    var foodItem: FoodItem
    
    // These values are examples and should be replaced with actual recommended daily values.
    let dailyCalories: Float = 2000.0
    let dailyCarbs: Float = 300.0 // in grams
    let dailyProtein: Float = 60.0 // in grams
    let dailyFat: Float = 70.0 // in grams

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(foodItem.name)
                .font(.title)

            VStack(alignment: .leading) {
                Text("Calories: \(foodItem.calories)")
                ProgressBar(value: Float(foodItem.calories), maxValue: dailyCalories, color: .green)
                Text("\(Int((Float(foodItem.calories) / dailyCalories) * 100))% of daily value")
                
                // Convert foodItem.carbs to Float since dailyCarbs is a Float
                Text("Carbs: \(foodItem.carbs, specifier: "%.1f")g")
                ProgressBar(value: Float(foodItem.carbs), maxValue: dailyCarbs, color: .blue)
                Text("\(Int((Float(foodItem.carbs) / dailyCarbs) * 100))% of daily value")
                
                // Convert foodItem.protein to Float since dailyProtein is a Float
                Text("Protein: \(foodItem.protein, specifier: "%.1f")g")
                ProgressBar(value: Float(foodItem.protein), maxValue: dailyProtein, color: .red)
                Text("\(Int((Float(foodItem.protein) / dailyProtein) * 100))% of daily value")
                
                // Convert foodItem.fat to Float since dailyFat is a Float
                Text("Fat: \(foodItem.fat, specifier: "%.1f")g")
                ProgressBar(value: Float(foodItem.fat), maxValue: dailyFat, color: .orange)
                Text("\(Int((Float(foodItem.fat) / dailyFat) * 100))% of daily value")
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
}
