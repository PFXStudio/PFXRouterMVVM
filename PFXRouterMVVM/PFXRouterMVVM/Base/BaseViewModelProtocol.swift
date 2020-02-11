//
//  BaseViewModelProtocol.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/11.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation

protocol BaseViewModelProtocol {
    associatedtype Input
    associatedtype Output
    associatedtype Dependency

    var input: Input! { get }
    var output: Output! { get }
//    var dependency: Dependency! { get }
}
