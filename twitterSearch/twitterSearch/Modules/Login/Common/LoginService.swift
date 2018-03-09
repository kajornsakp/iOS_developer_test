//
//  LoginService.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation
import Moya



public enum Login{
    case getOauthToken
}

extension Login : TargetType{
    
    public var baseURL : URL {
        return URL(string : "https://api.twitter.com/")!
    }
    
    public var path: String {
        switch self{
        case .getOauthToken:
            return "oauth2/token"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getOauthToken:
            return .post
        }
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var task: Task {
        switch self {
        case .getOauthToken:
            return .requestParameters(parameters: ["grant_type":"client_credentials"], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .getOauthToken:
            return ["Content-Type":"application/x-www-form-urlencoded","Authorization":"Basic \(TwitterConstant.bearerToken)"]
        }
    }
    
    
}
