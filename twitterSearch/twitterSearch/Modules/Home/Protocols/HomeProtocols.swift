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
    
    func showError(_ errorMessage : String)
    func showLoading()
    func hideLoading()
}

protocol HomeWireframeProtocol : class {
    static func createHomeModule() -> UIViewController
    
    func pushToSearchModule(from view : HomeViewProtocol)
}

protocol HomePresenterProtocol : class {
    var view : HomeViewProtocol? {get set}
    var wireframe : HomeWireframeProtocol? {get set}
    
    func viewDidLoad()
    func showSearchModule()
    func didReceivedStatuses(_ statuses : [Status])
}


