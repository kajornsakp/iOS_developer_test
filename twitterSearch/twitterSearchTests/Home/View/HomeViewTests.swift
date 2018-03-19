//
//  HomeViewTests.swift
//  twitterSearchTests
//
//  Created by Kajornsak Peerapathananont on 19/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import XCTest
@testable import twitterSearch

class HomeViewTests: XCTestCase {
    private var view : HomeViewController!
    private var mockPresenter : MockHomePresenter!
    
    override func setUp() {
        super.setUp()
        view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let _ = UINavigationController(rootViewController: view)
        mockPresenter = MockHomePresenter()
        view.presenter = mockPresenter
        let _ = view.view
    }
    
    override func tearDown() {
        view.removeFromParentViewController()
        view = nil
        mockPresenter = nil
        super.tearDown()
    }
    
    func testHomeTitleShouldBeExist() {
        view.viewWillAppear(true)
        XCTAssertEqual(view.title, "Twitter Search", "Title should be equal to Twitter Search (app name)")
    }
    func testHomeSearchBarShouldBeExist(){
        view.viewWillAppear(true)
        XCTAssertNotNil(view.searchBar, "Search bar should be exist")
        XCTAssertEqual(view.searchBar.placeholder!, "Search Tweets", "Search bar should have correct placeholder")
    }
    func testHomeNavigationShouldHaveSearchButton(){
        XCTAssertNotNil(view.navigationItem.rightBarButtonItem, "Home nav should have right button")
    }
    func testHomeShouldHaveEmptyView(){
        XCTAssertNotNil(view.emptyView, "Home should have empty view if there is no data")
    }
    func testHomeTableViewShouldHaveDataInCaseOfEmptyDataSource(){
        view.showTweets([], isAppended: false)
        XCTAssertEqual(view.tableView.numberOfRows(inSection: 0), 0, "Number of rows should be zero")
    }
    func testHomeTableViewShouldHaveData(){
        let status = Status(createdAt: "", id: "", text: "", truncated: false, retweetedCount: 0, favoriteCount: 0, user: User(id: "", name: "", screenName: "", location: "", profileImageUrl: ""))
        view.showTweets([status], isAppended: false)
        XCTAssertEqual(view.tableView.numberOfRows(inSection: 0), 1, "Number of rows should be one")
    }
    func testHomeTableViewCellShouldNotBeNil(){
        let status = Status(createdAt: "", id: "", text: "", truncated: false, retweetedCount: 0, favoriteCount: 0, user: User(id: "", name: "", screenName: "", location: "", profileImageUrl: ""))
        view.showTweets([status], isAppended: false)
        let cell = view.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! HomeTweetTableViewCell
        XCTAssertNotNil(cell.tweetTitle, "Title should not be nil")
        XCTAssertNotNil(cell.tweetText, "Text should not be nil")
        XCTAssertNotNil(cell.profileImageView, "Profile imageview should not be nil")
        XCTAssertNotNil(cell.retweetLabel, "Retweet label should not be nil")
        XCTAssertNotNil(cell.favoriteLabel, "Favorite label should not be nil")
    }
    func testHomeTableViewCellShouldDisplayData(){
        let status = Status(createdAt: "", id: "", text: "text", truncated: false, retweetedCount: 1, favoriteCount: 1, user: User(id: "", name: "name", screenName: "screenName", location: "", profileImageUrl: ""))
        view.showTweets([status], isAppended: false)
        let cell = view.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! HomeTweetTableViewCell
        XCTAssertEqual(cell.tweetTitle.text!, "@screenName", "Title should be screnName")
        XCTAssertEqual(cell.tweetText.text!, "text", "Text should be equal to text")
        XCTAssertEqual(cell.retweetLabel.text!, "1", "Retweet number should be one")
        XCTAssertEqual(cell.favoriteLabel.text!, "1", "Favorite number should be one")
    }
    
    func testHomeShouldCallSearchTweet() {
        mockPresenter.searchTweet("")
        XCTAssertTrue(mockPresenter.didCalledSearchTweet, "Search tweet should be called")
    }
    func testHomeShouldCallLoadMore() {
        mockPresenter.loadMoreTweets()
        XCTAssertTrue(mockPresenter.didCalledLoadMoreTweet, "Load more tweet should be called")
    }
    func testHomeShouldCallPushToDetailScreen() {
        mockPresenter.pushToDetailScreen(Status(createdAt: "", id: "", text: "", truncated: false, retweetedCount: 0, favoriteCount: 0, user: User(id: "", name: "", screenName: "", location: "", profileImageUrl: "")))
        XCTAssertTrue(mockPresenter.didCalledPushToNewScreen, "Push to detail screen should be called")
    }
    
}


fileprivate class MockHomePresenter : HomePresenterProtocol{
    var view: HomeViewProtocol?
    
    var wireframe: HomeWireframeProtocol?
    
    var interactor: HomeInteractorInputProtocol?
    var didCalledSearchTweet = false
    var didCalledLoadMoreTweet = false
    var didCalledPushToNewScreen = false
    func viewDidLoad() {
        //
    }
    
    func searchTweet(_ keyword: String) {
        didCalledSearchTweet = true
    }
    
    func loadMoreTweets() {
        didCalledLoadMoreTweet = true
    }
    
    func pushToDetailScreen(_ status: Status) {
        didCalledPushToNewScreen = true
    }
    
    
}
