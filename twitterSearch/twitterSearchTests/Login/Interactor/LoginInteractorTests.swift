//
//  LoginInteractorTests.swift
//  twitterSearchTests
//
//  Created by Kajornsak Peerapathananont on 18/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import XCTest
@testable import twitterSearch

class LoginInteractorTests: XCTestCase {
    
    var interactor : LoginInteractor!
    private var mockPresenter : MockPresenter!
    private var mockDataManager : MockDataManager!
    override func setUp() {
        super.setUp()
        interactor = LoginInteractor()
        mockPresenter = MockPresenter()
        mockDataManager = MockDataManager()
        interactor.presenter = mockPresenter
        interactor.dataManager = mockDataManager
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        interactor = nil
        mockPresenter = nil
        mockDataManager = nil
        super.tearDown()
    }

    func testLoginTwitter() {
        interactor.loginWithTwitter()
        
    }
}


fileprivate class MockPresenter : LoginPresenterProtocol,LoginInteractorOutputProtocol{
    var view: LoginViewProtocol?
    
    var interactor: LoginInteractorInputProtocol?
    
    var wireframe: LoginWireframeProtocol?
    
    func didTapLoginButton() {
        //
    }
    
    func didLoginSuccess() {
        //
    }
    
    func didLoginError(_ errorMessage: String) {
        //
    }
    
}

fileprivate class MockDataManager : LoginDataManagerInputProtocol{
    var requestHandler: LoginDataManagerOutputProtocol?
    
    func loginWithTwitter() {
        requestHandler?.didLoginSuccess("token")
    }
    
    
}
