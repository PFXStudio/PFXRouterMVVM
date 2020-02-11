//
//  ListSectionIModel.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/11.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import RxDataSources

public struct ListSectionModel {
    public var header: String
    public var items: [Item]
}

extension ListSectionModel: SectionModelType {
    public typealias Item = ItemModel

    public init(original: ListSectionModel, items: [Item]) {
        self.header = original.header
        self.items = items
    }
}
