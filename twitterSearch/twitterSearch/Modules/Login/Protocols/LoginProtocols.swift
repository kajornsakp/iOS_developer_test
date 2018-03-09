//
//  LoginProtocols.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit


protocol LoginViewProtocol : class {
    var presenter : LoginPresenterProtocol? {get set}
    
    func showError(_ errorMessage : String)
    func showLoading()
    func hideLoading()
}

protocol LoginWireframeProtocol : class {
    static func createLoginModule() -> UIViewController
    
    func presentSearchModule(from view : LoginViewProtocol)
}

protocol LoginPresenterProtocol : class {
    var view : LoginViewProtocol? {get set}
    var interactor : LoginInteractorInputProtocol? {get set}
    var wireframe : LoginWireframeProtocol? {get set}
    
    func didTapLoginButton()
}

protocol LoginInteractorOutputProtocol : class {
    func didLoginSuccess()
    func didLoginError(_ errorMessage : String)
}

protocol LoginInteractorInputProtocol : class {
    var presenter : LoginInteractorOutputProtocol? {get set}
    var dataManager : LoginDataManagerInputProtocol? {get set}
    
    func loginWithTwitter()
}

protocol LoginDataManagerInputProtocol : class {
    var requestHandler : LoginDataManagerOutputProtocol? {get set}
    
    func loginWithTwitter()
}

protocol LoginDataManagerOutputProtocol : class{
    func didLoginSuccess(_ token : String, secretKey : String)
    func didLoginError(_ errorMessage : String)
}
