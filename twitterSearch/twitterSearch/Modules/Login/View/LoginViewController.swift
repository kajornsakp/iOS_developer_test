//
//  LoginViewController.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var presenter: LoginPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didTapLoginButton(_ sender: Any) {
        presenter?.didTapLoginButton()
    }
    
}

extension LoginViewController : LoginViewProtocol{
    func showError(_ errorMessage: String) {
        print(errorMessage)
    }
    
    func showLoading() {
        print("loading")
    }
    
    func hideLoading() {
        print("hiding")
    }
    
  
}
