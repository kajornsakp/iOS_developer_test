//
//  LoginViewController.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit
import PKHUD

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
        HUD.flash(.labeledError(title: "Error", subtitle: errorMessage), delay: 1.0)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.flash(.success,delay : 1.0)
    }
    
  
}
