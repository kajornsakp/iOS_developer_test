//
//  AuthenModel.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation

struct AuthenModel : Codable {
    var tokenType : String
    var accessToken : String
    
    enum CodingKeys : String,CodingKey{
        case tokenType = "token_type"
        case accessToken = "access_token"
    }
}
