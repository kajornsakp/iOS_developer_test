//
//  LoginWireframeTests.swift
//  twitterSearchTests
//
//  Created by Kajornsak Peerapathananont on 16/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import XCTest
@testable import twitterSearch

class LoginWireframeTests: XCTestCase {
    
    var wireframe : LoginWireframe!
    override func setUp() {
        super.setUp()
        wireframe = LoginWireframe()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        wireframe = nil
        super.tearDown()
    }
    
    func testSetLoginWireframeToWindow(){
        let window = UIWindow()
        let nav = UINavigationController()
        window.rootViewController = nav
        let vc = LoginWireframe.createLoginModule()
        nav.addChildViewController(vc)
        XCTAssertTrue(nav.viewControllers[0] is LoginViewController, "LoginViewController should be existed.")
    }
    
    func testPushToHomeModule(){
        let vc = UIViewController()
        wireframe.presentSearchModule(from: vc as! LoginViewProtocol)
        XCTAssertTrue(vc.childViewControllers[0] is HomeViewController, "HomeViewController should be existed")
    }
}

