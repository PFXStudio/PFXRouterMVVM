//
//  DetailViewController.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/12.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class DetailViewController: UIViewController, BaseViewController {

    private let disposeBag = DisposeBag()

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var urlButton: UIButton!
    @IBOutlet private weak var descriptionTextView: UITextView!

    var viewModel: DetailViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        //  Setup bindings
        viewModel.title.asObservable().bind(to: titleLabel.rx.text).disposed(by: disposeBag)
        viewModel.author.asObservable().bind(to: authorLabel.rx.text).disposed(by: disposeBag)
        viewModel.description.asObservable().bind(to: descriptionTextView.rx.text).disposed(by: disposeBag)
        viewModel.url.asObservable().bind(to: urlButton.rx.title(for: .normal)).disposed(by: disposeBag)
    }

}
