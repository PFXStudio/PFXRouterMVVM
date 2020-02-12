//
//  GithubService.swift
//  PFXRouterMVVM
//
//  Created by succorer on 2020/02/12.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import Unbox

typealias GithubServiceSearchResult = Observable<[GithubModel]>

protocol GithubServiceProtocol {
    func searchRepo(with query: String) -> GithubServiceSearchResult
}

class GithubService: GithubServiceProtocol {

    enum ErrorType: Error {
        case invalidResponseFormat
    }

    func searchRepo(with query: String) -> GithubServiceSearchResult {
        let url = "https://api.github.com/search/repositories"
        let params = ["q": query]

        return GithubServiceSearchResult.create { (observer) -> Disposable in
            let requestReference = Alamofire.request(url, method: .get, parameters: params).responseJSON(completionHandler: { response in
                    if let value = response.result.value as? UnboxableDictionary {

                        if let items = value["items"] as? [UnboxableDictionary] {
                            let repos: [GithubModel] = items.compactMap({ item in
                                let repo: GithubModel? = try? unbox(dictionary: item)
                                return repo
                            })

                            observer.onNext(repos)
                            observer.onCompleted()
                        } else {
                            observer.onError(ErrorType.invalidResponseFormat)
                        }

                    } else if let error = response.result.error {
                        observer.onError(error)
                    }
                })

            return Disposables.create(with: {
                requestReference.cancel()
            })
        }
    }

}
