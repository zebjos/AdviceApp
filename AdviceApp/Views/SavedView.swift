//
//  SavedView.swift
//  AdviceApp
//
//  Created by Zeb Josefsson on 2025-08-12.
//

import Foundation
import SwiftUI
import SwiftData

struct SavedView: View {
    // SELECT all saved Advice objects from SwiftData
    // sorted on date, most recent first
    @Query(sort: \Advice.dateSaved, order: .reverse) private var savedAdvice: [Advice]
    
    var body: some View {
        NavigationStack {
            // Use UUID as the unique identifier
            List(savedAdvice, id: \.uuid) { advice in
                VStack(alignment: .leading) {
                    Text(advice.text)
                        .font(.headline)
                    Text("Saved: \(advice.dateSaved.formatted())")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Saved Advice")
        }
    }
}

// https://chatgpt.com/c/689c4c7e-a594-832d-bedf-b0b8f7419e78
#Preview {
    // In-memory SwiftData container with seeded data for the preview
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Advice.self, configurations: config)
    let context = ModelContext(container)

    // Seed a few sample Advice items (newest first so you can see sorting)
    let samples: [Advice] = [
        Advice(id: 1, text: "Stay hydrated and take stretch breaks.", dateSaved: Date().addingTimeInterval(-60)),
        Advice(id: 2, text: "Write small, testable units of code.", dateSaved: Date().addingTimeInterval(-3600)),
        Advice(id: 3, text: "Commit early and often with clear messages.", dateSaved: Date().addingTimeInterval(-86_400))
    ]
    samples.forEach { context.insert($0) }

    return SavedView()
        .modelContainer(container)
}
