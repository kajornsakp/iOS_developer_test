//
//  SearchProtocols.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit

protocol SearchViewProtocol : class {
    //presenter to view
    var presenter : SearchPresenterProtocol? {get set}
    
    func showError(_ errorMessage : String)
    func showLoading()
    func hideLoading()
    
}

protocol SearchWireframeProtocol : class {
    static func createSearchModule(with homePresenter : HomePresenterProtocol) -> UIViewController
    
    func presentTweetDetail(from view: SearchViewProtocol,forStatus status : TweetModel)
}

protocol SearchPresenterProtocol : class {
    var view : SearchViewProtocol? {get set}
    var interactor : SearchInteractorInputProtocol? {get set}
    var wireframe : SearchWireframeProtocol? {get set}
    
    func viewDidLoad()
    func searchTweet(_ keyword : String)
    func refreshTweet()
    func showTweetDetail(_ status: Status)
}

protocol SearchInteractorOutputProtocol : class {
    func didRetrievedTweets(_ tweet : TweetModel)
    func onError(_ errorMessage : String)
}

protocol SearchInteractorInputProtocol : class {
    var presenter : SearchInteractorOutputProtocol? {get set}
    var dataManager : SearchDataManagerInputProtocol? {get set}
    
    func retrieveTweets(_ keyword : String)
}

protocol SearchDataManagerInputProtocol : class{
    var requestHandler : SearchDataManagerOutputProtocol? {get set}
    
    func searchKeyword(_ key : String)
}

protocol SearchDataManagerOutputProtocol : class{
    func onTweetsRetrieved(_ tweet : TweetModel)
    func onError(_ errorMessage : String)
}
