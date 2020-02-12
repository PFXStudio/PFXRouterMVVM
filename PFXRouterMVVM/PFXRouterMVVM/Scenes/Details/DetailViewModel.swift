//
//  DetailViewModel.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/12.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

protocol DetailViewModelProtocol: BaseViewModel {
    var title: BehaviorRelay<String> { get }
    var author: BehaviorRelay<String> { get }
    var url: BehaviorRelay<String> { get }
    var description: BehaviorRelay<String> { get }
}

class DetailViewModel: DetailViewModelProtocol {

    let title: BehaviorRelay<String>
    let author: BehaviorRelay<String>
    let url: BehaviorRelay<String>
    let description: BehaviorRelay<String>

    let router: BaseRouter

    init(with router: BaseRouter, repo: GithubModel) {
        self.router = router

        title = BehaviorRelay<String>(value: repo.name)
        author = BehaviorRelay<String>(value: repo.owner)
        url = BehaviorRelay<String>(value: repo.url.absoluteString)
        description = BehaviorRelay<String>(value: repo.description)
    }
}
