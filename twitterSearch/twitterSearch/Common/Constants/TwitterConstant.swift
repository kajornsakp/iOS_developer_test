//
//  TwitterConstant.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation


public class TwitterConstant{
    //URL Query Allowed for RFC 1738
    static var consumerKey : String = "tyTh7PBxdauR4VKCkk1FRtH6b".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    static var consumerSecret : String = "XmPVf0FN3dT0mzdnPZH0U8iNs2ZQ3HnyqrJUBJtrWJKyzJRAso".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    static var bearerToken : String = Data("\(consumerKey):\(consumerSecret)".utf8).base64EncodedString()
}
