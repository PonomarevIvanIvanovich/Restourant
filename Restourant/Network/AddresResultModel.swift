//
//  AddresResultModel.swift
//  Restourant
//
//  Created by Иван Пономарев on 28.01.2023.
//

import Foundation

struct AddresResultModel: Codable {
    let suggestions: [Suggestion]
}

// MARK: - Suggestion
struct Suggestion: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let region: String?
    let city: String?
    let street_with_type: String?
    let house: String?
}

