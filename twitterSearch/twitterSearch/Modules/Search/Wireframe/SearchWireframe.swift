//
//  SearchWireframe.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit

class SearchWireframe : SearchWireframeProtocol{
    
    static var storyboard : UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    static func createSearchModule() -> UIViewController {
        let navController = storyboard.instantiateViewController(withIdentifier: "SearchNavigationController")
        if let vc = navController.childViewControllers.first as? SearchViewController {
            let presenter : SearchPresenterProtocol & SearchInteractorOutputProtocol = SearchPresenter()
            let interactor : SearchInteractorInputProtocol & SearchDataManagerOutputProtocol = SearchInteractor()
            let dataManager : SearchDataManagerInputProtocol = SearchDataManager()
            let wireframe : SearchWireframeProtocol = SearchWireframe()
            vc.presenter = presenter
            presenter.view = vc
            presenter.wireframe = wireframe
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.dataManager = dataManager
            dataManager.requestHandler = interactor
            return navController
        }
        return UIViewController()
    }
    
    func presentTweetDetail(from view: SearchViewProtocol, forStatus status: TweetModel) {
        //
    }
    
    
}
