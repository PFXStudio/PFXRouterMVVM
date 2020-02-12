//
//  BaseViewController.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/12.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation

protocol BaseViewController: class {

    associatedtype ViewModelType

    var viewModel: ViewModelType! { get set }
}
