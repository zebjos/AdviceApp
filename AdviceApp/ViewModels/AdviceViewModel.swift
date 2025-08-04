//
//  AdviceViewModel.swift
//  AdviceApp
//
//  Created by Zeb Josefsson on 2025-08-04.
//

import Foundation

@MainActor
class AdviceViewModel: ObservableObject {
    @Published var adviceText: String = "Tap the button to get advice"

    private let adviceService = AdviceService()

    func fetchAdvice() async {
        do {
            let advice = try await adviceService.fetchRandomAdvice()
            adviceText = advice.advice
            print("Advice Text: \(advice.advice)")
        } catch {
            adviceText = "Failed to fetch advice"
            print(error.localizedDescription)
        }
    }
}
