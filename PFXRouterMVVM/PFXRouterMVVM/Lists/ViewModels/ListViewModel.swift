//
//  ListViewModel.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/11.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation

class ListViewModel: BaseViewModel, BaseViewModelProtocol {
    struct Input {}
    struct Output {
    }
    struct Dependency {
    }

    var input: ListViewModel.Input!
    var output: ListViewModel.Output!
    var dependency: ListViewModel.Dependency!

}
