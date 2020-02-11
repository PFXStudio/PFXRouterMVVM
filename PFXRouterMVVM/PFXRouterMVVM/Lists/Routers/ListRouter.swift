//
//  ListRouter.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/11.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import UIKit

class ListRouter: BaseRouter {
    static var patterns: [String] {
        return ["tx"]
    }

    static func viewController(path: [String], param: [String: Any]) -> UIViewController? {
        return UIViewController()
    }

}
