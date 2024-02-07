//
//  DailyIntakeView.swift
//  CalorieTracker
//
//  Created by Siddanth Raja on 2/5/24.
//

import SwiftUI

struct DailyIntakeView: View {
    @State private var showingAddFoodItemView = false
    @State var sampleFoods = [
        // Your sample food items
        FoodItem(name: "Apple", calories: 95, carbs: 25, protein: 0.5, fat: 0.3),
        FoodItem(name: "Grilled Chicken Breast", calories: 165, carbs: 0, protein: 31, fat: 3.6)
    ]
    
    // Recommended daily calorie intake
    let recommendedCalories: Float = 2000.0
    // Total calorie intake
    var totalCalories: Float {
        sampleFoods.reduce(0) { $0 + Float($1.calories)}}

    // Recommended daily protein intake
    let recommendedProtein: Float = 60.0
    // Total protein intake
    var totalProtein: Float {
        sampleFoods.reduce(0) { $0 + Float($1.protein)}}

    var body: some View {
        NavigationView {
            List {
                HStack {
                    // Calorie intake circle chart
                    CircularProgressCalorieView(progress: totalCalories, total: recommendedCalories)
                        .frame(width: 150, height: 150) // Adjust the size as needed
                        .padding(.horizontal)
                        .padding(.vertical)
                        
                    
                    // Protein intake circle chart
                    CircularProgressProteinView(progress: totalProtein, total: recommendedProtein)
                        .frame(width: 150, height: 150) // Adjust the size as needed
                        .padding(.horizontal)
                        .padding(.vertical)
                }

                // List of foods
                ForEach(sampleFoods) { food in
                    NavigationLink(destination: FoodItemDetailView(foodItem: food)) {
                        Text(food.name)
                    }
                }
            }
            .navigationTitle("Daily Intake")
            .navigationBarItems(trailing: Button(action: {
                self.showingAddFoodItemView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddFoodItemView) {
                AddFoodItemView(isPresented: $showingAddFoodItemView, sampleFoods: $sampleFoods)
            }
        }
    }
}


struct DailyIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        DailyIntakeView()
    }
}
