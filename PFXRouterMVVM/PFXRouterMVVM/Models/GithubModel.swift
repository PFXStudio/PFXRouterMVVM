//
//  GithubModel.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/12.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import Unbox

struct GithubModel {
    let name: String
    let description: String
    let owner: String
    let url: URL
}

extension GithubModel: Unboxable {
    init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.description = try unboxer.unbox(key: "description")
        self.owner = try unboxer.unbox(keyPath: "owner.login")
        self.url = try unboxer.unbox(key: "html_url")
    }
}
