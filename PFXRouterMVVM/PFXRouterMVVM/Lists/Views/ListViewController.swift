//
//  ListViewController.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/11.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxDataSources

class ListViewController: BaseViewController {
    private var disposeBag = DisposeBag()
    private var rxDataSource: RxTableViewSectionedReloadDataSource<ListSectionModel>?
    var viewModel: ListViewModel!

}
