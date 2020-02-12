//
//  SearchRouter.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/12.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import UIKit

class SearchRouter: BaseRouter {

    enum RouteType {
        case repoDetails(GithubModel)
    }

    weak var baseViewController: UIViewController?

    func present(on baseVC: UIViewController, animated: Bool, context: Any?, completion: ((Bool) -> Void)?) {

    }

    func enqueueRoute(with context: Any?, animated: Bool, completion: ((Bool) -> Void)?) {
        guard let routeType = context as? RouteType else {
            assertionFailure("The route type missmatches")
            return
        }

        guard let baseViewController = baseViewController else {
            assertionFailure("baseViewController is not set")
            return
        }

        switch routeType {
        case .repoDetails(let repo):
            let detailsRouter = DetailRouter()
            let presentationContext = DetailRouter.PresentationContext.view(repo)
            detailsRouter.present(on: baseViewController, animated: true, context: presentationContext, completion: nil)
        }
    }

    func dismiss(animated: Bool, context: Any?, completion: ((Bool) -> Void)?) {

    }
}
