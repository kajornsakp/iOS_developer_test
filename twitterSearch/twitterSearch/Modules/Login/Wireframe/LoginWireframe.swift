//
//  LoginWireframe.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit

class LoginWireframe : LoginWireframeProtocol{
    static var storyboard : UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createLoginModule() -> UIViewController {
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let presenter : LoginPresenterProtocol & LoginInteractorOutputProtocol = LoginPresenter()
        let interactor : LoginInteractorInputProtocol & LoginDataManagerOutputProtocol = LoginInteractor()
        let dataManager : LoginDataManagerInputProtocol = LoginDataManager()
        let wireframe : LoginWireframeProtocol = LoginWireframe()
        vc.presenter = presenter
        presenter.view = vc
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.requestHandler = interactor
        return vc
    }
    
    func presentSearchModule(from view: LoginViewProtocol) {
        let vc = view as! LoginViewController
        vc.present(SearchWireframe.createSearchModule(), animated: true, completion: nil)
    }
}
