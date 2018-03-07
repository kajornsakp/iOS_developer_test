//
//  SearchPresenter.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation

class SearchPresenter : SearchPresenterProtocol{
    weak var view: SearchViewProtocol?
    
    var interactor: SearchInteractorInputProtocol?
    
    var wireframe: SearchWireframeProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveTweets()
    }
    
    func showTweetDetail(_ status: Status) {
        //
    }
    
    
}

extension SearchPresenter : SearchInteractorOutputProtocol{
    func didRetrievedTweets(_ tweet: TweetModel) {
        view?.hideLoading()
        view?.showTweets(with: tweet)
    }
    func onError(_ errorMessage: String) {
        view?.hideLoading()
        view?.showError(errorMessage)
    }
    
}

