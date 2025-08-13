//
//  Advice.swift
//  AdviceApp
//
//  Created by Zeb Josefsson on 2025-08-09.
//

import Foundation
import SwiftData

@Model
class Advice {
    // UUID to allow saving advice with the same id multiple times
    var uuid: UUID
    var id: Int
    var text: String
    var dateSaved: Date
    var reflections: [ReflectionNote]

    init(id: Int, text: String, dateSaved: Date = Date(), reflections: [ReflectionNote] = []) {
        self.uuid = UUID()
        self.id = id
        self.text = text
        self.dateSaved = dateSaved
        self.reflections = reflections
    }
}
