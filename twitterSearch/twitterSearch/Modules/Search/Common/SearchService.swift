//
//  SearchService.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation
import Moya
import TwitterKit

public enum Twitter{
    case search(String)
}

extension Twitter : TargetType{
    
    public var baseURL : URL {
        return URL(string : "https://api.twitter.com/")!
    }
    
    public var path: String {
        switch self{
        case .search(_):
            return "1.1/search/tweets.json"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
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
        switch self {
        case .search(_):
            return ["Content-Type":"application/json",
                    "Authorization":"Bearer \(UserDefaults.standard.string(forKey: "twitterSearch.loginBearerToken") ?? "")"]
        }
    }
    
    
}
//AAAAAAAAAAAAAAAAAAAAAC1L4wAAAAAADmTtbtiHClBHFOvGMW9um46U6mo%3DtDW5gDAHR3UytOrAy6ZGRB3PnNK6r5JGyzT1bxmVsPD1u3sEBK

/*
 OAuth oauth_consumer_key="tyTh7PBxdauR4VKCkk1FRtH6b",oauth_token="345428104-dxFj5NTgrQ8yFyYcsFA7tWnvvkqxp8gAHPTDfbpd",oauth_signature_method="HMAC-SHA1",oauth_timestamp="1520485794",oauth_nonce="0548CD077E2B412BAD695B2364644433",oauth_version="1.0",oauth_signature="Z6Wr7Ohs8sxbh6L%2BPPFGVUylNNk%3D"
 
 
 
 //            let method = "POST"
 //            let q = "Hello Ladies + Gentlemen, a signed OAuth request!".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 //            let oauth_consumer_key = "xvz1evFS4wEEPTGEFPHBog".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 //            let oauth_consumer_secret = "XmPVf0FN3dT0mzdnPZH0U8iNs2ZQ3HnyqrJUBJtrWJKyzJRAso".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 //            let oauth_nonce = "kYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 //            let oauth_token = "370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 //            let oauth_secret = UserDefaults.standard.string(forKey: "twitterSearch.authTokenSecret")?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 //            let oauth_signature_method = "HMAC-SHA1".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 //            let oauth_timestamp = "\(Date().timeIntervalSince1970)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 let method = self.method.rawValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 let q = key.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 let oauth_consumer_key = "tyTh7PBxdauR4VKCkk1FRtH6b".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 let oauth_consumer_secret = "XmPVf0FN3dT0mzdnPZH0U8iNs2ZQ3HnyqrJUBJtrWJKyzJRAso".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 let oauth_nonce = "0548CD077E2B412BAD695B2364644433".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 let oauth_token = UserDefaults.standard.string(forKey: "twitterSearch.authToken")?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 let oauth_secret = UserDefaults.standard.string(forKey: "twitterSearch.authTokenSecret")?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 let oauth_signature_method = "HMAC-SHA1".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 let oauth_timestamp = "\(Date().timeIntervalSince1970)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 let paramenterString = "oauth_consumer_key=\(oauth_consumer_key)&oauth_nonce=\(oauth_nonce)&oauth_signature_method=\(oauth_signature_method)&oauth_timestamp=\(oauth_timestamp)&oauth_token=\(oauth_token)&oauth_version=1.0&q=\(q)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 let oauth_url = (self.baseURL.absoluteString+self.path).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
 let signatureBaseString = "\(method)&\(oauth_url)&\(paramenterString)"
 let signingKey = "\(oauth_consumer_secret)&\(oauth_secret)"
 let password : Array<UInt8> = Array(signatureBaseString.utf8)
 let salt : Array<UInt8> = Array(signingKey.utf8)
 var signature = ""
 do {
 signature = (try HKDF(password: password, salt: salt, variant: .sha1).calculate().toBase64()?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))!
 print(signature)
 }catch{
 
 }
 */
