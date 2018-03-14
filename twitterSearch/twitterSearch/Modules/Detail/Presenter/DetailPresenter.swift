//
//  DetailPresenter.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 13/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import Foundation

class DetailPresenter : DetailPresenterProtocol{
    var view: DetailViewProtocol?
    var wireframe: DetailWireframeProtocol?
    var status : Status?
    
    func viewDidLoad() {
        guard let status = status else {return}
        view?.showTweetDetail(status)
    }
}


