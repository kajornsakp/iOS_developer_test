//
//  TweetModel.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation

struct SearchMetadata : Codable {
    var maxId : String
    var count : Int
    var sinceId : String
    var query : String
    var nextResult : String?
    enum CodingKeys : String,CodingKey{
        case maxId = "max_id_str"
        case sinceId = "since_id_str"
        case nextResult = "next_results"
        case count
        case query
    }
}
struct User : Codable {
    var id : String
    var name : String
    var screenName : String
    var location : String
    var profileImageUrl : String
    
    enum CodingKeys : String,CodingKey{
        case id = "id_str"
        case screenName = "screen_name"
        case profileImageUrl = "profile_image_url_https"
        
        case name
        case location
    }
}

struct Status: Codable{
    var createdAt : String
    var id : String
    var text : String
    var truncated : Bool
    var retweetedCount : Int
    var favoriteCount : Int
    var user : User
    enum CodingKeys : String,CodingKey{
        case createdAt = "created_at"
        case id = "id_str"
        case retweetedCount = "retweet_count"
        case favoriteCount = "favorite_count"
        
        case text = "full_text"
        case truncated
        case user
    }
}

struct TweetModel: Codable {
    var statuses : [Status]
    var searchMetadata : SearchMetadata
    
    enum CodingKeys : String,CodingKey{
        case searchMetadata = "search_metadata"
        case statuses
    }
}

