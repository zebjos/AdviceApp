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

    private let adviceService = AdviceService()

    // Context given from the view
    var context: ModelContext?
    
    func fetchAdvice() async {
        do {
            let advice = try await adviceService.fetchRandomAdvice()
            adviceText = advice.advice
            print("Advice Text: \(advice.advice)")
            
            saveAdvice(id: advice.id, text: advice.advice)
        } catch {
            adviceText = "Failed to fetch advice"
            print(error.localizedDescription)
        }
    }
    
    // Used to save the fetched adviceto SwiftData
    func saveAdvice(id: Int, text: String) {
            guard let context = context else {
                print("Failed to save")
                return
            }

            let newAdvice = Advice(id: id, text: text)
            context.insert(newAdvice)

            do {
                try context.save()
                print("Saved advice: \(text)")
            } catch {
                print("Failed to save advice: \(error.localizedDescription)")
            }
        }
}
