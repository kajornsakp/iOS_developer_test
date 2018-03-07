//
//  SearchService.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation
import Moya

public enum Twitter{
    case search(String)
}

extension Twitter : TargetType{
    
    public var baseURL : URL {
        return URL(string : "https://api.twitter.com/1.1")!
    }
    
    public var path: String {
        switch self{
        case .search(let _):
            return "/search/tweets.json"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var task: Task {
        switch self {
        case .search(let key):
            return .requestParameters(parameters: ["q":key], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-Type":"application/json","Authorization":"Bearer AAAAAAAAAAAAAAAAAAAAAC1L4wAAAAAADmTtbtiHClBHFOvGMW9um46U6mo%3DtDW5gDAHR3UytOrAy6ZGRB3PnNK6r5JGyzT1bxmVsPD1u3sEBK"]
    }
    
    
}

