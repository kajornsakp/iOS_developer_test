//
//  SearchInteractor.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation

class SearchInteractor: SearchInteractorInputProtocol {
    var presenter: SearchInteractorOutputProtocol?
    
    
    var dataManager: SearchDataManagerInputProtocol?
    
    func retrieveTweets() {
        dataManager?.searchKeyword("บุพเพสันนิวาส")
    }
    
    
}


extension SearchInteractor : SearchDataManagerOutputProtocol{
    func onTweetsRetrieved(_ tweet: TweetModel) {
        presenter?.didRetrievedTweets(tweet)
    }
    
    func onError(_ errorMessage: String) {
        presenter?.onError(errorMessage)
    }
    
    
}
