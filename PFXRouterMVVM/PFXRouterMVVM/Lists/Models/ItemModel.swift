//
//  ItemModel.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/11.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation

public struct ItemModel: Codable {
    var uniqueKey = 0
    var price = ""
    var oily_score = 0
    var dry_score = 0
    var sensitive_score = 0
    var thumbnail_image = ""
    var full_size_image = ""
    var title = ""
    var description = ""
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)

        if let uniqueKey = try container.decodeIfPresent(Int.self, forKey: .uniqueKey) {
            self.uniqueKey = uniqueKey
        }

        if let price = try container.decodeIfPresent(String.self, forKey: .price) {
            self.price = price
        }

        if let oily_score = try container.decodeIfPresent(Int.self, forKey: .oily_score) {
            self.oily_score = oily_score
        }

        if let dry_score = try container.decodeIfPresent(Int.self, forKey: .dry_score) {
            self.dry_score = dry_score
        }

        if let sensitive_score = try container.decodeIfPresent(Int.self, forKey: .sensitive_score) {
            self.sensitive_score = sensitive_score
        }

        if let thumbnail_image = try container.decodeIfPresent(String.self, forKey: .thumbnail_image) {
            self.thumbnail_image = thumbnail_image
        }

        if let full_size_image = try container.decodeIfPresent(String.self, forKey: .full_size_image) {
            self.full_size_image = full_size_image
        }

        if let description = try container.decodeIfPresent(String.self, forKey: .description) {
            self.description = description.replacingOccurrences(of: "\\n", with: "\n")
        }

        if let title = try container.decodeIfPresent(String.self, forKey: .title) {
            self.title = title
        }
    }

    public mutating func merge(from newItem: ItemModel) {
        if self.uniqueKey != newItem.uniqueKey {
            return
        }

        if newItem.thumbnail_image.count > 0 {
            self.thumbnail_image = newItem.thumbnail_image
        }

        if newItem.full_size_image.count > 0 {
            self.full_size_image = newItem.full_size_image
        }

        if newItem.description.count > 0 {
            self.description = newItem.description
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        try container.encode(uniqueKey, forKey: .uniqueKey)
        try container.encode(price, forKey: .price)
        try container.encode(oily_score, forKey: .oily_score)
        try container.encode(dry_score, forKey: .dry_score)
        try container.encode(sensitive_score, forKey: .sensitive_score)
        try container.encode(full_size_image, forKey: .full_size_image)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
    }

    enum Keys: String, CodingKey {
        case uniqueKey = "id"
        case price = "price"
        case oily_score = "oily_score"
        case dry_score = "dry_score"
        case sensitive_score = "sensitive_score"
        case thumbnail_image = "thumbnail_image"
        case full_size_image = "full_size_image"
        case title = "title"
        case description = "description"
    }

    public func koreanPrice() -> String {
        guard let value = Int(self.price) else {
            return ""
        }

        return NumberFormatter.localizedString(from: NSNumber(value: value), number: NumberFormatter.Style.decimal) + "원"
    }
}
