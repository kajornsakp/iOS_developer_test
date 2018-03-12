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
    var tempKey : String = ""
    func viewDidLoad() {
        
    }
    func searchTweet(_ keyword : String){
        view?.showLoading()
        tempKey = keyword
        interactor?.retrieveTweets(keyword)
    }
    func showTweetDetail(_ status: Status) {
        //
    }
    func refreshTweet() {
        interactor?.retrieveTweets(tempKey)
    }
    
}

extension SearchPresenter : SearchInteractorOutputProtocol{
    func didRetrievedTweets(_ tweet: TweetModel) {
        view?.hideLoading()
        
    }
    func onError(_ errorMessage: String) {
        view?.showError(errorMessage)
    }
    
}

