//
//  HomeProtocols.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 11/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit

protocol HomeViewProtocol : class {
    var presenter : HomePresenterProtocol? {get set}
    
    func showTweets(_ statuses : [Status])
    func showError(_ errorMessage : String)
    func showLoading()
    func hideLoading()
}

protocol HomeWireframeProtocol : class {
    static func createHomeModule() -> UIViewController
}

protocol HomePresenterProtocol : class {
    var view : HomeViewProtocol? {get set}
    var wireframe : HomeWireframeProtocol? {get set}
    var interactor : HomeInteractorInputProtocol? {get set}
    func viewDidLoad()
    func searchTweet(_ keyword : String)
}

protocol HomeInteractorOutputProtocol : class {
    func didRetrievedTweets(_ tweet : TweetModel)
    func onError(_ errorMessage : String)
}

protocol HomeInteractorInputProtocol : class {
    var presenter : HomeInteractorOutputProtocol? {get set}
    var dataManager : HomeDataManagerInputProtocol? {get set}
    
    func retrieveTweets(_ keyword : String)
}

protocol HomeDataManagerInputProtocol : class {
    var requestHandler : HomeDataManagerOutputProtocol? {get set}
    
    func searchKeyword(_ key : String)
}

protocol HomeDataManagerOutputProtocol : class{
    func onTweetsRetrieved(_ tweet : TweetModel)
    func onError(_ errorMessage : String)
}
