//
//  TweetModelTests.swift
//  twitterSearchTests
//
//  Created by Kajornsak Peerapathananont on 16/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import XCTest
@testable import twitterSearch

class TweetModelTests: XCTestCase {
    var tweetModel : TweetModel!
    override func setUp() {
        super.setUp()
        if let url = Bundle(for: type(of: self)).url(forResource: "TweetModel", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                tweetModel = try decoder.decode(TweetModel.self, from: data)
            } catch let error {
                XCTFail("Unable to decode json : \(error.localizedDescription)")
            }
        }
        else {
            XCTFail("TweetModel.json not found")
        }
    }
    
    func testSearchMetadataMappingJSONShouldSuccess(){
        let searchMetadata = tweetModel.searchMetadata
        XCTAssertEqual(searchMetadata.maxId, "974557478338707456")
        XCTAssertEqual(searchMetadata.count, 15)
        XCTAssertEqual(searchMetadata.sinceId, "0")
        XCTAssertEqual(searchMetadata.query, "bangkok")
        guard let nextResult = searchMetadata.nextResult else {XCTFail("No next result");return}
        XCTAssertEqual(nextResult, "?max_id=974557421992476672&q=bangkok&include_entities=1")
    }
}
