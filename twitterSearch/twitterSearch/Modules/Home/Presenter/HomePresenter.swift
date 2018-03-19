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
    var tweet : TweetModel?
    func viewDidLoad() {
        
    }
    func searchTweet(_ keyword: String) {
        view?.showLoading()
        interactor?.retrieveTweets(keyword)
    }
    func loadMoreTweets() {
        view?.showLoading()
        guard let tweet = tweet else {view?.showError("Can't load more tweets");return}
        guard var nextResult = tweet.searchMetadata.nextResult else {view?.showError("Can't load more tweets");return}
        nextResult.removeFirst()
        var maxId = nextResult.components(separatedBy: "&")
                            .filter{$0.contains("max_id")}.first?
                            .components(separatedBy: "=").last
        guard let nextId = maxId else {view?.showError("Can't load more tweets");return}
        interactor?.loadMoreTweets(nextId,tweet.searchMetadata.query)
    }
    
    func pushToDetailScreen(_ status: Status) {
        let vc = view as! HomeViewController
        let secondVC = DetailWireframe.createDetailModule(status)
        vc.navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension HomePresenter : HomeInteractorOutputProtocol{
    func didRetrievedTweets(_ tweet: TweetModel,isAppended : Bool) {
        self.tweet = tweet
        view?.hideLoading()
        view?.showTweets(tweet.statuses,isAppended: isAppended)
    }
    
    func onError(_ errorMessage: String) {
        view?.showError(errorMessage)
    }
    
    
}
