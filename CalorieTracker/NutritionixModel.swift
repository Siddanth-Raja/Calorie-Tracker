//
//  NutritionixModel.swift
//  CalorieTracker
//
//  Created by Siddanth Raja on 2/14/24.
//

import Foundation

struct Food: Decodable {
    let food_name: String
    let serving_qty: Int
    let serving_unit: String
    let serving_weight_grams: Double
    let nf_calories: Double
    // Add all other nutritional information fields as needed
}
