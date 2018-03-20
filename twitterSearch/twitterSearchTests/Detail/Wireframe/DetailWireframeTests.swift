//
//  DetailWireframeTests.swift
//  twitterSearchTests
//
//  Created by Kajornsak Peerapathananont on 20/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import XCTest
@testable import twitterSearch
class DetailWireframeTests: XCTestCase {
    
    
    func testDetailModuleShouldBeLoaded(){
        let nav = UINavigationController()
        let status = Status(createdAt: "", id: "", text: "text", truncated: false, retweetedCount: 1, favoriteCount: 1, user: User(id: "", name: "name", screenName: "screenName", location: "", profileImageUrl: ""))
        let vc = DetailWireframe.createDetailModule(status)
        nav.addChildViewController(vc)
        XCTAssertTrue(nav.viewControllers[0] is DetailViewController, "DetailViewController should be loaded")
    }
    
    
}
