//
//  SearchViewController.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/12.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewController: UIViewController, BaseViewController {

    private let disposeBag = DisposeBag()

    @IBOutlet private weak var searchTextfield: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var resultlLabel: UILabel!
    @IBOutlet private weak var loadingWheel: UIActivityIndicatorView!

    var viewModel: SearchViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        //  Setup bindings

        searchTextfield.rx.text.bind(to: viewModel.searchText).disposed(by: disposeBag)
        viewModel.showLoadingWheel.asObservable().bind(to: loadingWheel.rx.isAnimating).disposed(by: disposeBag)

        viewModel.listItems.asObservable().bind(to: tableView.rx.items) { (tableView, _, element) in

            let cell: UITableViewCell
            let reuseId = "SearchCell"
            if let reusedCell = tableView.dequeueReusableCell(withIdentifier: reuseId) {
                cell = reusedCell
            } else {
                cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: reuseId)
            }

            cell.textLabel?.text = element.title
            cell.detailTextLabel?.text = element.description

            return cell

        }.disposed(by: disposeBag)

        tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in

            self?.viewModel.listIndexSelected.onNext(indexPath.row)

        }).disposed(by: disposeBag)

        viewModel.listItems.asObservable().subscribe(onNext: { [weak self] list in
            guard let `self` = self else {
                return
            }

            if list.count > 0 {
                self.resultlLabel.text = "Repositories found: \(list.count)"
            } else {
                self.resultlLabel.text = "No result"
            }
        }).disposed(by: disposeBag)
    }

}
