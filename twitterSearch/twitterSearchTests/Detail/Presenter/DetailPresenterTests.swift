//
//  DetailPresenterTests.swift
//  twitterSearchTests
//
//  Created by Kajornsak Peerapathananont on 20/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import XCTest
@testable import twitterSearch

class DetailPresenterTests: XCTestCase {
    
    private var presenter : DetailPresenter!
    private var mockView : MockViewController!
    private var mockWireframe : MockWireframe!
    
    override func setUp() {
        super.setUp()
        presenter = DetailPresenter()
        mockView = MockViewController()
        mockWireframe = MockWireframe()
        presenter.wireframe = mockWireframe
        presenter.view = mockView
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testPassDataToView(){
        let status = Status(createdAt: "", id: "", text: "text", truncated: false, retweetedCount: 1, favoriteCount: 1, user: User(id: "", name: "name", screenName: "screenName", location: "", profileImageUrl: ""))
        presenter.status = status
        presenter.viewDidLoad()
        XCTAssertTrue(mockView.didReceivedTweet, "View should receive tweet from presenter")
    }
}

fileprivate class MockWireframe : DetailWireframeProtocol{
    static func createDetailModule(_ status: Status) -> UIViewController {
        return UIViewController()
    }
}


fileprivate class MockViewController : DetailViewProtocol{
    var presenter: DetailPresenterProtocol?
    var didReceivedTweet = false
    
    func showTweetDetail(_ status: Status) {
        didReceivedTweet = true
    }
}
