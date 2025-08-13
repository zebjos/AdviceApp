//
//  AdviceAppApp.swift
//  AdviceApp
//
//  Created by Zeb Josefsson on 2025-07-27.
//

import SwiftUI
import SwiftData

@main
struct AdviceAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        // SwiftData container to store Advice
        .modelContainer(for: [Advice.self, ReflectionNote.self])
    }
}
