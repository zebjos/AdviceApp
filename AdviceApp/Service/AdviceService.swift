//
//  AdviceService.swift
//  AdviceApp
//
//  Created by Zeb Josefsson on 2025-07-27.
//

import Foundation

struct AdviceResponse: Codable {
    let slip: AdviceSlip
}

struct AdviceSlip: Codable {
    let id: Int
    let advice: String
}

class AdviceService {
    func fetchRandomAdvice() async throws -> AdviceSlip {
        let urlString = "https://api.adviceslip.com/advice"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(AdviceResponse.self, from: data)
            return decoded.slip
        } catch {
            throw error
        }
    }
}
