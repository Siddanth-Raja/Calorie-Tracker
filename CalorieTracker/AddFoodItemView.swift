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
    @State private var searchResults: [NutritionixService.Food] = []

    private var nutritionixService = NutritionixService()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Search Foods")) {
                    TextField("Search", text: $searchText, onCommit: fetchNutritionData)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                Section(header: Text("Results")) {
                    ForEach(searchResults, id: \.self) { food in
                        Button(food.food_name) {
                            fillForm(with: food)
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

    func fetchNutritionData() {
        nutritionixService.fetchNutrition(forFood: searchText) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let foods):
                    self.searchResults = foods
                case .failure(let error):
                    print(error.localizedDescription) // Handle errors appropriately in your app
                }
            }
        }
    }

    func fillForm(with food: NutritionixService.Food) {
        self.name = food.food_name
        self.calories = String(food.nf_calories)
        self.carbs = String(food.nf_total_carbohydrate)
        self.protein = String(food.nf_protein)
        self.fat = String(food.nf_total_fat)
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
}
