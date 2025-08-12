//
//  MainView.swift
//  AdviceApp
//
//  Created by Zeb Josefsson on 2025-08-12.
//

import Foundation
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SavedView()
                .tabItem {
                    Label("Saved", systemImage: "star")
                }
            
            ReflectionView()
                .tabItem {
                    Label("Reflect", systemImage: "pencil")
                }
            
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar")
                }
        }
    }
}

#Preview {
    MainView()
}
