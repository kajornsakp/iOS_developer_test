//
//  LoginInteractor.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation


class LoginInteractor : LoginInteractorInputProtocol{
    var presenter: LoginInteractorOutputProtocol?
    
    var dataManager: LoginDataManagerInputProtocol?
    func loginWithTwitter() {
        dataManager?.loginWithTwitter()
    }
}

extension LoginInteractor : LoginDataManagerOutputProtocol{
    func didLoginSuccess(_ token: String) {
        UserDefaults.standard.set(token, forKey: "twitterSearch.loginBearerToken")
        presenter?.didLoginSuccess()
    }
    
    func didLoginError(_ errorMessage: String) {
        presenter?.didLoginError(errorMessage)
    }
    
    
}
