//
//  LoginPresenterTests.swift
//  twitterSearchTests
//
//  Created by Kajornsak Peerapathananont on 19/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import XCTest
@testable import twitterSearch

class LoginPresenterTests: XCTestCase {
    
    private var presenter : LoginPresenter!
    private var mockView : MockViewController!
    private var mockInteractor : MockInteractor!
    private var mockWireframe : MockWireframe!
    
    override func setUp() {
        super.setUp()
        presenter = LoginPresenter()
        mockView = MockViewController()
        mockInteractor = MockInteractor()
        mockWireframe = MockWireframe()
        
        presenter.interactor = mockInteractor
        presenter.view = mockView
        presenter.wireframe = mockWireframe
    }
    
    override func tearDown() {
        presenter = nil
        mockView = nil
        mockInteractor = nil
        mockWireframe = nil
        super.tearDown()
    }
    func testLoginWithTwitterShouldBeCalled() {
        presenter.didTapLoginButton()
        XCTAssertTrue(mockInteractor.isLoginWithTwitterCalled, "loginWithTwitter() should be called")
    }
    func testErrorMessageShouldReceive() {
        presenter.didLoginError("Error")
        XCTAssertEqual(mockView.errorMessage, "Error", "Error message should be equal")
    }
    func testPresentSearchModuleShoubleBeCalled(){
        presenter.didLoginSuccess()
        XCTAssertTrue(mockWireframe.isPresentSearchModule, "Seach Module Should be called after login success")
    }
    func testShowLoadingShouldBeCalled(){
        presenter.didTapLoginButton()
        XCTAssertTrue(mockView.isLoading, "Loading should be show after tap login button")
    }
    
    func testHideLoadingShouldBeCalledAfterSuccess(){
        presenter.didLoginSuccess()
        XCTAssertFalse(mockView.isLoading, "Loading should be show after login success")
    }
    func testHideLoadingShouldBeCalledAfterFailure(){
        presenter.didLoginSuccess()
        XCTAssertFalse(mockView.isLoading, "Loading should be show after login error")
    }
}


fileprivate class MockInteractor : LoginInteractorInputProtocol{
    var presenter: LoginInteractorOutputProtocol?
    
    var dataManager: LoginDataManagerInputProtocol?
    var isLoginWithTwitterCalled = false
    
    func loginWithTwitter() {
        isLoginWithTwitterCalled = true
    }
    
    
}

fileprivate class MockWireframe : LoginWireframeProtocol{
    var isPresentSearchModule = false
    static func createLoginModule() -> UIViewController {
        return UIViewController()
    }
    
    func presentSearchModule(from view: LoginViewProtocol) {
        isPresentSearchModule = true
    }
}


fileprivate class MockViewController : LoginViewProtocol{
    var presenter: LoginPresenterProtocol?
    var errorMessage : String = ""
    var isLoading = false
    func showError(_ errorMessage: String) {
        self.errorMessage = errorMessage
    }
    
    func showLoading() {
        isLoading = true
    }
    
    func hideLoading() {
        isLoading = false
    }
    
    
}
