//
//  HomePresenterTests.swift
//  twitterSearchTests
//
//  Created by Kajornsak Peerapathananont on 19/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import XCTest
@testable import twitterSearch

class HomePresenterTests: XCTestCase {
    
    private var presenter : HomePresenter!
    private var mockInteractor : MockInteractor!
    private var mockView : MockViewController!
    private var mockWireframe : MockWireframe!
    
    override func setUp() {
        super.setUp()
        presenter = HomePresenter()
        mockInteractor = MockInteractor()
        mockView = MockViewController()
        mockWireframe = MockWireframe()
        
        presenter.interactor = mockInteractor
        presenter.wireframe = mockWireframe
        presenter.view = mockView
    }
    
    override func tearDown() {
        presenter = nil
        mockInteractor = nil
        mockView = nil
        mockWireframe = nil
        super.tearDown()
    }
    
    func testRetrieveTweetsDidCalled() {
        presenter.searchTweet("")
        XCTAssertTrue(mockInteractor.didCalledRetrieveTweet, "Retrieve tweets shoud be called")
    }
    
    func testLoadMoreTweetsShouldBeSuccess() {
        presenter.searchTweet("")
        presenter.tweet = TweetModel(statuses: [], searchMetadata: SearchMetadata(maxId: "", count: 0, sinceId: "", query: "bangkok", nextResult: "?max_id=974557421992476672&q=bangkok&include_entities=1"))
        presenter.loadMoreTweets()
        XCTAssertTrue(mockInteractor.didCalledRetrieveTweet && mockInteractor.didCalledLoadMoreTweet, "Load more tweets should be success if already searched tweet")
    }
    
    func testLoadMoreTweetsShouldBeFail() {
        presenter.loadMoreTweets()
        XCTAssertFalse(mockInteractor.didCalledRetrieveTweet && mockInteractor.didCalledLoadMoreTweet, "Load more tweets should be fail if not searched tweet")
    }
    
    func testTweetsShoubleBeUpdateToTableView(){
        var tweets = [Status]()
        for _ in 0..<5{
            let tweet = Status(createdAt: "", id: "", text: "", truncated: false, retweetedCount: 0, favoriteCount: 0, user: User(id: "", name: "", screenName: "", location: "", profileImageUrl: ""))
            tweets.append(tweet)
        }
        var tweetModel = TweetModel(statuses: tweets, searchMetadata: SearchMetadata(maxId: "", count: 0, sinceId: "", query: "bangkok", nextResult: "?max_id=974557421992476672&q=bangkok&include_entities=1"))
        presenter.didRetrievedTweets(tweetModel, isAppended: false)
        XCTAssertEqual(mockView.tableView.numberOfRows(inSection: 0), 5, "Tableview should has 5 cells")
    }
    func testTweetsShoubleBeAppendToTableView(){
        var tweets = [Status]()
        for _ in 0..<5{
            let tweet = Status(createdAt: "", id: "", text: "", truncated: false, retweetedCount: 0, favoriteCount: 0, user: User(id: "", name: "", screenName: "", location: "", profileImageUrl: ""))
            tweets.append(tweet)
        }
        var tweetModel = TweetModel(statuses: tweets, searchMetadata: SearchMetadata(maxId: "", count: 0, sinceId: "", query: "bangkok", nextResult: "?max_id=974557421992476672&q=bangkok&include_entities=1"))
        var tweetModel2 = TweetModel(statuses: tweets, searchMetadata: SearchMetadata(maxId: "", count: 0, sinceId: "", query: "bangkok", nextResult: "?max_id=974557421992476672&q=bangkok&include_entities=1"))
        presenter.didRetrievedTweets(tweetModel, isAppended: false)
        presenter.didRetrievedTweets(tweetModel2, isAppended: true)
        XCTAssertEqual(mockView.tableView.numberOfRows(inSection: 0), 10, "Tableview should has 10 cells")
    }
    
}

fileprivate class MockInteractor : HomeInteractorInputProtocol{
    var presenter: HomeInteractorOutputProtocol?
    
    var dataManager: HomeDataManagerInputProtocol?
    var didCalledRetrieveTweet = false
    var didCalledLoadMoreTweet = false
    
    func retrieveTweets(_ keyword: String) {
        didCalledRetrieveTweet = true
    }
    
    func loadMoreTweets(_ maxId: String, _ key: String) {
        didCalledLoadMoreTweet = true
    }
    
    
}

fileprivate class MockWireframe : HomeWireframeProtocol{
    
    static func createHomeModule() -> UIViewController {
        return UIViewController()
    }
    
}

fileprivate class MockViewController : HomeViewProtocol{
    var presenter: HomePresenterProtocol?
    var tweets : [Status]?
    var tableView : UITableView!
    var dataSource : MockDataSource!
    
    init() {
        tableView = UITableView(frame: .zero, style: .plain)
        dataSource = MockDataSource()
        tableView.dataSource = dataSource
    }
    
    func showTweets(_ statuses: [Status], isAppended: Bool) {
        self.tweets = statuses
        if(isAppended){
            dataSource.appendTweetsForDataSource(tweets: statuses)
        }else{
            dataSource.setNewTweetsForDataSource(tweets: statuses)
        }
        tableView.reloadData()
    }
    
    func showError(_ errorMessage: String) {
        //
    }
    
    func showLoading() {
        //
    }
    
    func hideLoading() {
        //
    }
    
    class MockDataSource : NSObject,UITableViewDataSource{
        private var tweets : [Status]?
        
        func setNewTweetsForDataSource(tweets : [Status]){
            self.tweets = tweets
        }
        func appendTweetsForDataSource(tweets : [Status]){
            self.tweets?.append(contentsOf: tweets)
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tweets?.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
    
    
}


