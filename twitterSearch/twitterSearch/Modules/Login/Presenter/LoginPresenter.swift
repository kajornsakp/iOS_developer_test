//
//  LoginPresenter.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation


class LoginPresenter : LoginPresenterProtocol{
    
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    var wireframe: LoginWireframeProtocol?
    
    func didTapLoginButton() {
        interactor?.loginWithTwitter()
    }
}

extension LoginPresenter : LoginInteractorOutputProtocol{
    func didLoginSuccess() {
        wireframe?.presentSearchModule(from: view!)
    }
    
    func didLoginError(_ errorMessage: String) {
        view?.showError(errorMessage)
    }
    
    
}
