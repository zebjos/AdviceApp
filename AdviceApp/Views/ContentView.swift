//
//  ContentView.swift
//  AdviceApp
//
//  Created by Zeb Josefsson on 2025-07-27.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var viewModel = AdviceViewModel()
    // Retrieve the ModelContext so this view and ViewModel can
    // read and write to the context
    @Environment(\.modelContext) private var context

    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.adviceText)
                .padding()
                .multilineTextAlignment(.center)
                .font(.title2)

            Button("Advice call") {
                Task {
                    await viewModel.fetchAdvice()
                }
            }
            .padding()
        }
        .onAppear {
            Task {
                // Pass the SwiftData context to ViewModel
                viewModel.context = context
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Advice.self, inMemory: true)
}
