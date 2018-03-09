//
//  SearchDataManager.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation
import Moya

class SearchDataManager : SearchDataManagerInputProtocol{
    var requestHandler: SearchDataManagerOutputProtocol?
    let provider = MoyaProvider<Twitter>()
    
    func searchKeyword(_ key: String) {
        provider.request(.search(key)){ result in
            switch result{
            case .success(let result):
                do {
                    let tweet : TweetModel = try result.map(TweetModel.self)
                    self.requestHandler?.onTweetsRetrieved(tweet)
                }catch{
                    print(error)
                }
            case .failure(let error):
                print(error.response)
            }
        }
    }
    
    func searchKeywordLegacy(_ key : String){
        provider.request(.search(key)){ result in
            switch result{
            case .success(let result):
                do {
                    let tweet : TweetModel = try result.map(TweetModel.self)
                    self.requestHandler?.onTweetsRetrieved(tweet)
                }catch{
                    print(error)
                }
            case .failure(let error):
                print(error.response)
            }
        }
    }
}
