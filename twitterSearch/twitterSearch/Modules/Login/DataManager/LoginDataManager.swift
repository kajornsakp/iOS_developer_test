//
//  LoginDataManager.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation
import TwitterKit
import Moya

class LoginDataManager : LoginDataManagerInputProtocol{
    var requestHandler: LoginDataManagerOutputProtocol?
    var provider = MoyaProvider<Login>()
    
    func loginWithTwitter() {
        TWTRTwitter.sharedInstance().logIn{session,error in
            if(session != nil){
                self.requestHandler?.didLoginSuccess((session?.authToken)!, secretKey: (session?.authTokenSecret)!)
                self.getToken()
            }else{
                self.requestHandler?.didLoginError((error?.localizedDescription)!)
            }
        }
    }
    
    fileprivate func getToken(){
        provider.request(.getOauthToken){ result in
            switch result{
            case .success(let result):
                do {
                    let tweet : AuthenModel = try result.map(AuthenModel.self)
                    UserDefaults.standard.set(tweet.accessToken, forKey: "twitterSearch.loginBearerToken")
                }catch{
                    print(error)
                }
            case .failure(let error):
                print(error.response)
            }
        }
    }
    
}
