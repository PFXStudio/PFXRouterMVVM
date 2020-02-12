//
//  DetailRouter.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/12.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import UIKit

class DetailRouter: BaseRouter {

    enum PresentationContext {
        case view(GithubModel)
    }

    weak var baseViewController: UIViewController?

    func present(on baseVC: UIViewController, animated: Bool, context: Any?, completion: ((Bool) -> Void)?) {
        guard let presentationContext = context as? PresentationContext else {
            assertionFailure("The context type missmatch")
            return
        }

        switch presentationContext {
        case .view(let repo):
            let viewController = StoryboardScene.Main.instantiateRepoDetailsViewController()

            let viewModel = DetailViewModel.init(with: self, repo: repo)
            viewController.viewModel = viewModel

            baseVC.navigationController?.pushViewController(viewController, animated: true)
            baseViewController = baseVC
        }
    }

    func enqueueRoute(with context: Any?, animated: Bool, completion: ((Bool) -> Void)?) {

    }

    func dismiss(animated: Bool, context: Any?, completion: ((Bool) -> Void)?) {

    }
}
