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
    func loadMoreTweets(_ maxId: String, _ key: String) {
        dataManager?.searchNextPage(maxId, key)
    }
}


extension HomeInteractor : HomeDataManagerOutputProtocol{
    func onTweetsRetrieved(_ tweet: TweetModel, isAppended: Bool) {
        presenter?.didRetrievedTweets(tweet,isAppended: isAppended)
    }

    func onError(_ errorMessage: String) {
        presenter?.onError(errorMessage)
    }
}
