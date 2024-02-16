//
//  FoodItem.swift
//  CalorieTracker
//
//  Created by Siddanth Raja on 2/5/24.
//

import Foundation

struct FoodItem: Identifiable, Decodable {
    var id = UUID()
    var food_name: String
    var serving_qty: Int
    var serving_unit: String
    var serving_weight_grams: Double
    var nf_calories: Double
    var nf_total_fat: Double
    var nf_saturated_fat: Double?
    var nf_cholesterol: Double?
    var nf_sodium: Double
    var nf_total_carbohydrate: Double
    var nf_dietary_fiber: Double?
    var nf_sugars: Double?
    var nf_protein: Double
    var nf_potassium: Double?
    var nf_p: Double?

    // add more properties to match the Nutritionix API response if needed
}

