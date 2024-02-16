//
//  NutritionixService.swift
//  CalorieTracker
//
//  Created by Siddanth Raja on 2/14/24.
//

import Foundation

class NutritionixService {
    private let appId = "3019f2cb"
    private let appKey = "290775e6d5ad93b8bb1f7ca86ea3902c"

    func fetchNutrition(forFood food: String, completion: @escaping (Result<[FoodItem], Error>) -> Void) {
        guard let url = URL(string: "https://trackapi.nutritionix.com/v2/natural/nutrients") else {
            completion(.failure(NSError(domain: "NutritionixService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(appId, forHTTPHeaderField: "x-app-id")
        request.addValue(appKey, forHTTPHeaderField: "x-app-key")
        request.httpBody = try? JSONEncoder().encode(["query": food])

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: "NutritionixService", code: -2, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(NutritionixResponse.self, from: data)
                completion(.success(response.foods))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
