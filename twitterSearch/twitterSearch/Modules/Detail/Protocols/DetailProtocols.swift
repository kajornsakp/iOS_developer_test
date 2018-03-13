//
//  DetailProtocols.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 13/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit

protocol DetailViewProtocol : class {
    var presenter : DetailPresenterProtocol? {get set}
    
}

protocol DetailWireframeProtocol : class{
    static func createDetailModule(_ status : Status) -> UIViewController
}

protocol DetailPresenterProtocol : class {
    var view : DetailViewProtocol? {get set}
    var wireframe : DetailWireframeProtocol? {get set}
}


