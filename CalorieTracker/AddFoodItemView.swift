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
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Food Details")) {
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
                    Button("Add Food Item") {
                        addFoodItem()
                    }
                }
            }
            .navigationTitle("Add Food Item")
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
        
        // Dismiss the view
        isPresented = false
    }
}
