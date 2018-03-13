//
//  HomePresenter.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 12/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireframe: HomeWireframeProtocol?
    
    func viewDidLoad() {
        
    }
    func searchTweet(_ keyword: String) {
        view?.showLoading()
        interactor?.retrieveTweets(keyword)
        print(keyword)
    }
}

extension HomePresenter : HomeInteractorOutputProtocol{
    func didRetrievedTweets(_ tweet: TweetModel) {
        view?.hideLoading()
        view?.showTweets(tweet.statuses)
    }
    
    func onError(_ errorMessage: String) {
        view?.showError(errorMessage)
    }
    
    
}
