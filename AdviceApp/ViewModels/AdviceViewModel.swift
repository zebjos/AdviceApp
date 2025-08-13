//
//  AdviceViewModel.swift
//  AdviceApp
//
//  Created by Zeb Josefsson on 2025-08-02.
//

import Foundation
import SwiftData

@MainActor
class AdviceViewModel: ObservableObject {
    @Published var adviceText: String = "Tap the button to get advice"
    @Published var currentAdviceID: Int?

    private let adviceService = AdviceService()

    // Context given from the view
    var context: ModelContext?
    
    func fetchAdvice() async {
        do {
            let advice = try await adviceService.fetchRandomAdvice()
            adviceText = advice.advice
            currentAdviceID = advice.id
            print("Advice Text: \(advice.advice)")
        } catch {
            adviceText = "Failed to fetch advice"
            print(error.localizedDescription)
        }
    }
    
    // Used to save the fetched adviceto SwiftData
    func saveAdvice() {
        guard let context = context,
              let id = currentAdviceID else {
            print("Failed to save: no context or no advice loaded")
            return
        }

        let newAdvice = Advice(id: id, text: adviceText)
        context.insert(newAdvice)

        do {
            try context.save()
            print("Saved advice: \(newAdvice.text)")
        } catch {
            print("Failed to save advice: \(error.localizedDescription)")
        }
    }
}
