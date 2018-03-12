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
            let presenter : HomePresenterProtocol = HomePresenter()
            let wireframe : HomeWireframeProtocol = HomeWireframe()
            vc.presenter = presenter
            presenter.view = vc
            presenter.wireframe = wireframe
            return navController
        }
        return UIViewController()
    }
    
    func pushToSearchModule(from view: HomeViewProtocol) {
        let searchVC = SearchWireframe.createSearchModule(with: view.presenter!)
        let homeVC = view as! HomeViewController
        homeVC.navigationController?.pushViewController(searchVC, animated: true)
    }
}
