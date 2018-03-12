//
//  HomePresenter.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 12/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    var view: HomeViewProtocol?
    
    var wireframe: HomeWireframeProtocol?
    
    func viewDidLoad() {
        
    }
    
    func showSearchModule() {
        wireframe?.pushToSearchModule(from: view!)
    }
    
    func didReceivedStatuses(_ statuses: [Status]) {
        print(statuses)
    }
}
