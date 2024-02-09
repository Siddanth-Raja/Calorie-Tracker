//
//  AddFoodItemView.swift
//  CalorieTracker
//
//  Created by Siddanth Raja on 2/5/24.
//

import SwiftUI

struct AddFoodItemView: View {
    @Binding var isPresented: Bool
    @Binding var sampleFoods: [FoodItem]

    @State private var name: String = ""
    @State private var calories: String = ""
    @State private var carbs: String = ""
    @State private var protein: String = ""
    @State private var fat: String = ""
    @State private var searchText = ""

    var filteredPresetFoods: [PresetFoodItem] {
        if searchText.isEmpty {
            return presetFoods
        } else {
            return presetFoods.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Search Foods")) {
                    TextField("Search", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                Section(header: Text("Foods")) {
                    ForEach(filteredPresetFoods, id: \.name) { food in
                        Button(food.name) {
                            // Fill in the form with the selected preset
                            self.name = food.name
                            self.calories = "\(food.calories)"
                            self.carbs = "\(food.carbs)"
                            self.protein = "\(food.protein)"
                            self.fat = "\(food.fat)"
                        }
                    }
                }

                Section(header: Text("Food Overview")) {
                    TextField("Name", text: $name)
                    TextField("Calories", text: $calories)
                        .keyboardType(.numberPad)
                    TextField("Carbs (g)", text: $carbs)
                        .keyboardType(.decimalPad)
                    TextField("Protein (g)", text: $protein)
                        .keyboardType(.decimalPad)
                    TextField("Fat (g)", text: $fat)
                        .keyboardType(.decimalPad)
                }

                Section {
                    Button("Add Food") {
                        addFoodItem()
                    }
                }
            }
            .navigationTitle("Add Food")
            .toolbar {
                Button("Cancel") {
                    isPresented = false
                }
            }
        }
    }

    func addFoodItem() {
        guard let caloriesInt = Int(calories),
              let carbsDouble = Double(carbs),
              let proteinDouble = Double(protein),
              let fatDouble = Double(fat) else {
            // Handle the error, maybe show an alert
            return
        }

        let newFoodItem = FoodItem(name: name, calories: caloriesInt, carbs: carbsDouble, protein: proteinDouble, fat: fatDouble)
        sampleFoods.append(newFoodItem)
        isPresented = false
    }

    struct PresetFoodItem: Identifiable {
        let id = UUID()
        var name: String
        var calories: Int
        var carbs: Double
        var protein: Double
        var fat: Double
    }

    // Example preset foods
    let presetFoods = [
        PresetFoodItem(name: "Banana", calories: 89, carbs: 22.8, protein: 1.1, fat: 0.3),
        PresetFoodItem(name: "Brown Rice (1 cup, cooked)", calories: 216, carbs: 44.8, protein: 5.0, fat: 1.8),
        PresetFoodItem(name: "Almonds (1 oz)", calories: 164, carbs: 6.1, protein: 6.0, fat: 14.2),
        PresetFoodItem(name: "Apple", calories: 95, carbs: 25, protein: 0.5, fat: 0.3),
        PresetFoodItem(name: "Grilled Chicken Breast", calories: 165, carbs: 0, protein: 31, fat: 3.6),

        // Add more presets as needed
    ]
}

