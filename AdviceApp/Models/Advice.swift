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
    var id: Int
    var text: String
    var dateSaved: Date

    init(id: Int, text: String, dateSaved: Date = Date()) {
        self.id = id
        self.text = text
        self.dateSaved = dateSaved
    }
}
