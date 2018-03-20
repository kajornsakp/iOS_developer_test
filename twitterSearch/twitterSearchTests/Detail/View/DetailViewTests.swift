//
//  DetailViewTests.swift
//  twitterSearchTests
//
//  Created by Kajornsak Peerapathananont on 19/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import XCTest
@testable import twitterSearch

class DetailViewTests: XCTestCase {
    
    private var view : DetailViewController!
    private var mockPresenter : MockDetailPresenter!
    
    override func setUp() {
        super.setUp()
        let status = Status(createdAt: "", id: "", text: "", truncated: false, retweetedCount: 0, favoriteCount: 0, user: User(id: "", name: "", screenName: "", location: "", profileImageUrl: ""))
        view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let _ = UINavigationController(rootViewController: view)
        mockPresenter = MockDetailPresenter()
        view.presenter = mockPresenter
        let _ = view.view
    }
    
    override func tearDown() {
        view.removeFromParentViewController()
        view = nil
        mockPresenter = nil
        super.tearDown()
    }

    func testComponentsShouldNotBeNil() {
        XCTAssertNotNil(view.screennameLabel, "Screen name label should be initialized")
        XCTAssertNotNil(view.usernameLabel, "User name label should be initialized")
        XCTAssertNotNil(view.profileImageView, "Profile imageview should be initialized")
        XCTAssertNotNil(view.tweetTextLabel, "Tweet text label should be initialized")
        XCTAssertNotNil(view.favoritedCountLabel, "Favorite count label should be initialized")
        XCTAssertNotNil(view.retweetedCountLabel, "Retweet count label should be initialized")
    }
    func testComponentsShouldDisplayCorrectly(){
        let status = Status(createdAt: "", id: "", text: "text", truncated: false, retweetedCount: 1, favoriteCount: 1, user: User(id: "", name: "name", screenName: "screenName", location: "", profileImageUrl: ""))
        view.showTweetDetail(status)
        XCTAssertEqual(view.screennameLabel.text!, "name", "Screen name should display correctly")
        XCTAssertEqual(view.usernameLabel.text!, "@screenName", "User name should display correctly")
        XCTAssertEqual(view.tweetTextLabel.text!, "text", "Tweet text should display correctly")
        XCTAssertEqual(view.favoritedCountLabel.text!, "1", "favorite count should display one")
        XCTAssertEqual(view.retweetedCountLabel.text!, "1", "retweet count should display one")
    }
}

fileprivate class MockDetailPresenter : DetailPresenterProtocol{
    var view: DetailViewProtocol?
    var wireframe: DetailWireframeProtocol?
    var status: Status?
    
    var didCalledViewDidLoad = false
    
    func viewDidLoad() {
        view?.showTweetDetail(status!)
        didCalledViewDidLoad = true
    }
    
    
    
}
