//
//  LoginDataManager.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation
import Moya

class LoginDataManager : LoginDataManagerInputProtocol{
    var requestHandler: LoginDataManagerOutputProtocol?
    var provider = MoyaProvider<Login>()
    
    func loginWithTwitter() {
        self.getToken{ result,error in
            if let error = error{
                self.requestHandler?.didLoginError(error)
            }
            self.requestHandler?.didLoginSuccess((result?.accessToken)!)
        }
    }
    
    fileprivate func getToken(completion : @escaping (_ result : AuthenModel?,_ error : String?)->Void){
        provider.request(.getOauthToken){ result in
            switch result{
            case .success(let result):
                do {
                    let tweet : AuthenModel = try result.map(AuthenModel.self)
                    completion(tweet,nil)
                }catch{
                    completion(nil,error.localizedDescription)
                }
            case .failure(let error):
                completion(nil,error.errorDescription)
            }
        }
    }
    
}
