//
//  HomeDataManager.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 12/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation
import Moya

class HomeDataManager : HomeDataManagerInputProtocol{
    var requestHandler: HomeDataManagerOutputProtocol?
    let provider = MoyaProvider<Twitter>()
    
    func searchKeyword(_ key: String) {
        provider.request(.search(key)){ result in
            switch result{
            case .success(let result):
                do {
                    let tweet : TweetModel = try result.map(TweetModel.self)
                    self.requestHandler?.onTweetsRetrieved(tweet)
                }catch{
                    self.requestHandler?.onError("Cannot retrieve tweets")
                    print(error)
                }
            case .failure(let error):
                self.requestHandler?.onError(error.localizedDescription)
            }
        }
    }
}
