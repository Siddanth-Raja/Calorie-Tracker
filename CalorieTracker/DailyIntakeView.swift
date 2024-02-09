//
//  DailyIntakeView.swift
//  CalorieTracker
//
//  Created by Siddanth Raja on 2/5/24.
//

import SwiftUI

struct DailyIntakeView: View {
    @State private var showingAddFoodItemView = false
    @State var sampleFoods: [FoodItem] = [] // Initialize as empty array
    
    // Recommended daily calorie and protein intake
    let recommendedCalories: Float = 2000.0
    let recommendedProtein: Float = 60.0

    // Total calorie and protein intake
    var totalCalories: Float {
        sampleFoods.reduce(0) { $0 + Float($1.calories) }
    }
    var totalProtein: Float {
        sampleFoods.reduce(0) { $0 + Float($1.protein) }
    }

    var body: some View {
        NavigationView {
            List {
                HStack {
                    CircularProgressCalorieView(progress: totalCalories, total: recommendedCalories)
                        .frame(width: 150, height: 150)
                        .padding()
                    
                    CircularProgressProteinView(progress: totalProtein, total: recommendedProtein)
                        .frame(width: 150, height: 150)
                        .padding()
                }

                // Check if sampleFoods is empty and display a message or the list of foods
                if sampleFoods.isEmpty {
                    Text("No foods added yet. Tap '+' to add.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ForEach(sampleFoods) { food in
                        NavigationLink(destination: FoodItemDetailView(foodItem: food)) {
                            Text(food.name)
                        }
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
