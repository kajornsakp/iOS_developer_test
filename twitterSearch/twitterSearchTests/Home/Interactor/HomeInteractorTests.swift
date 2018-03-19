//
//  HomeInteractorTests.swift
//  twitterSearchTests
//
//  Created by Kajornsak Peerapathananont on 19/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import XCTest
@testable import twitterSearch

class HomeInteractorTests: XCTestCase {
    private var interactor : HomeInteractor!
    private var mockPresenter : MockHomePresenter!
    private var mockDataManager : MockHomeDataManager!
    
    override func setUp() {
        super.setUp()
        interactor = HomeInteractor()
        mockPresenter = MockHomePresenter()
        interactor.presenter = mockPresenter
        mockDataManager = MockHomeDataManager()
        interactor.dataManager = mockDataManager
        mockDataManager.requestHandler = interactor
    }
    
    override func tearDown() {
        interactor = nil
        mockPresenter = nil
        mockDataManager = nil
        super.tearDown()
    }
    func testSearchKeywordShouldBeCalled() {
        interactor.retrieveTweets("")
        XCTAssertTrue(mockDataManager.searchKeywordDidCalled, "Search keyword should be called")
    }
    func testSearchNextPageShouldBeCalled() {
        interactor.loadMoreTweets("", "")
        XCTAssertTrue(mockDataManager.searchNextPageDidCalled, "Search next page (load more) should be called")
    }
    func testSearchKeyWordShouldSuccess(){
        mockDataManager.forceError = false
        interactor.retrieveTweets("")
        XCTAssertTrue(mockPresenter.isSuccess, "Search should be success if the tweets were loaded")
    }
    func testSearchKeyWordShouldFail(){
        mockDataManager.forceError = true
        interactor.retrieveTweets("")
        XCTAssertTrue(mockPresenter.isError, "Search should be fail if the api is error")
    }
    func testSearchNextPageShouldSuccess(){
        mockDataManager.forceError = false
        interactor.loadMoreTweets("", "")
        XCTAssertTrue(mockPresenter.isSuccess, "Search next page (load more) should be success if the tweets were loaded")
    }
    func testSearchNextPageShouldFail(){
        mockDataManager.forceError = true
        interactor.loadMoreTweets("", "")
        XCTAssertTrue(mockPresenter.isError, "Search  next page (load more) should be fail if the api is error")
    }
    
}


fileprivate class MockHomePresenter : HomePresenterProtocol, HomeInteractorOutputProtocol{
    var view: HomeViewProtocol?
    
    var wireframe: HomeWireframeProtocol?
    
    var interactor: HomeInteractorInputProtocol?
    var isSuccess = false
    var isError = false
    func viewDidLoad() {
        //
    }
    
    func searchTweet(_ keyword: String) {
        //
    }
    
    func loadMoreTweets() {
        //
    }
    
    func pushToDetailScreen(_ status: Status) {
        //
    }
    
    func didRetrievedTweets(_ tweet: TweetModel, isAppended: Bool) {
        isSuccess = true
    }
    
    func onError(_ errorMessage: String) {
        isError = true
    }
}

fileprivate class MockHomeDataManager : HomeDataManagerInputProtocol {
    var requestHandler: HomeDataManagerOutputProtocol?
    var searchKeywordDidCalled = false
    var searchNextPageDidCalled = false
    var forceError = false
    
    func searchKeyword(_ key: String) {
        searchKeywordDidCalled = true
        if !forceError {
            requestHandler?.onTweetsRetrieved(TweetModel(statuses: [], searchMetadata: SearchMetadata(maxId: "", count: 0, sinceId: "", query: "bangkok", nextResult: "?max_id=974557421992476672&q=bangkok&include_entities=1")), isAppended: false)
        }else{
            requestHandler?.onError("")
        }
    }
    
    func searchNextPage(_ maxId: String, _ key: String) {
        searchNextPageDidCalled = true
        if !forceError {
            requestHandler?.onTweetsRetrieved(TweetModel(statuses: [], searchMetadata: SearchMetadata(maxId: "", count: 0, sinceId: "", query: "bangkok", nextResult: "?max_id=974557421992476672&q=bangkok&include_entities=1")), isAppended: true)
        }else{
            requestHandler?.onError("")
        }
    }
    
    
}
