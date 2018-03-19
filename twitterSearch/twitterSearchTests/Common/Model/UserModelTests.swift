//
//  TweetModelTests.swift
//  twitterSearchTests
//
//  Created by Kajornsak Peerapathananont on 15/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import XCTest
@testable import twitterSearch

class UserModelTests: XCTestCase {
    var user : User!
    override func setUp() {
        if let url = Bundle(for: type(of: self)).url(forResource: "User", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                user = try decoder.decode(User.self, from: data)
            } catch let error {
                XCTFail("Unable to decode json : \(error.localizedDescription)")
            }
        }
        else {
            XCTFail("User.json not found")
        }
    }
    func testUserModelJSONMappingShoudBeSuccess(){
        XCTAssertEqual(user.id, "63024397")
        XCTAssertEqual(user.name, "EXO ❤️≡✗⊙↳₴")
        XCTAssertEqual(user.screenName, "dewlyandcb")
        XCTAssertEqual(user.profileImageUrl, "https://pbs.twimg.com/profile_images/969007664293330944/viacnCuR_normal.jpg")
        XCTAssertEqual(user.location, "-Aeriverse")
        
    }
}
