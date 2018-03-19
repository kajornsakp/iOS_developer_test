//
//  LoginViewTests.swift
//  twitterSearchTests
//
//  Created by Kajornsak Peerapathananont on 19/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import XCTest
@testable import twitterSearch

class LoginViewTests: XCTestCase {
    private var view : LoginViewController!
    private var mockPresenter : MockPresenter!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        view = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        mockPresenter = MockPresenter()
        view.presenter = mockPresenter
        let _ = view.view
    }
    
    override func tearDown() {
        view = nil
        mockPresenter = nil
        super.tearDown()
    }
    func testViewShouldBeInstantiateFromStoryboard(){
        XCTAssertNotNil(view, "View should not be nil")
    }
}


fileprivate class MockPresenter : LoginPresenterProtocol{
    var view: LoginViewProtocol?
    
    var interactor: LoginInteractorInputProtocol?
    
    var wireframe: LoginWireframeProtocol?
    
    var isTapLoginCalled = false
    func didTapLoginButton() {
        isTapLoginCalled = true
    }
    
    
}
