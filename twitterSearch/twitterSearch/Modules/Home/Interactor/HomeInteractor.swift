//
//  HomeInteractor.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 12/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation

class HomeInteractor : HomeInteractorInputProtocol{
    var presenter: HomeInteractorOutputProtocol?
    var dataManager: HomeDataManagerInputProtocol?
    
    func retrieveTweets(_ keyword: String) {
        dataManager?.searchKeyword(keyword)
    }
}


extension HomeInteractor : HomeDataManagerOutputProtocol{
    func onTweetsRetrieved(_ tweet: TweetModel) {
        presenter?.didRetrievedTweets(tweet)
    }
    func onError(_ errorMessage: String) {
        presenter?.onError(errorMessage)
    }
}
