//
//  ContentView.swift
//  AdviceApp
//
//  Created by Zeb Josefsson on 2025-07-27.
//

import SwiftUI

struct ContentView: View {
    let adviceService = AdviceService()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Advice call") {
                Task {
                    do {
                        let advice = try await adviceService.fetchRandomAdvice()
                        print(advice)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
