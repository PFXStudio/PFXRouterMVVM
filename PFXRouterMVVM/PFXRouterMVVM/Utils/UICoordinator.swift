//
//  UICoordinator.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/12.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import UIKit

class UICoordinator {

    func presentInitialScreen(on window: UIWindow) {
        let router = SearchRouter()
        let navigationVC = StoryboardScene.Main.instantiateNavigationController()
        let viewModel = SearchViewModel.init(with: router)

        guard let viewController = navigationVC.topViewController as? SearchViewController else {
            assertionFailure("Main storyboard configured not properly")
            return
        }

        viewController.viewModel = viewModel
        router.baseViewController = viewController

        window.rootViewController = navigationVC
    }

}
