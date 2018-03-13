//
//  HomeWireframe.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 12/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit

class HomeWireframe: HomeWireframeProtocol {
    static var storyboard : UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createHomeModule() -> UIViewController {
        let navController = storyboard.instantiateViewController(withIdentifier: "HomeNavigationController")
        if let vc = navController.childViewControllers.first as? HomeViewController{
            let presenter : HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let wireframe : HomeWireframeProtocol = HomeWireframe()
            let interactor : HomeInteractorInputProtocol & HomeDataManagerOutputProtocol = HomeInteractor()
            let dataManager : HomeDataManagerInputProtocol = HomeDataManager()
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

}
