//
//  ContentView.swift
//  AdviceApp
//
//  Created by Zeb Josefsson on 2025-07-27.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = AdviceViewModel()

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
                await viewModel.fetchAdvice()
            }
        }
    }
}

#Preview {
    ContentView()
}
