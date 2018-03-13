//
//  DetailWireframe.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 13/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit

class DetailWireframe: DetailWireframeProtocol {
    static var storyboard : UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    static func createDetailModule(_ status: Status) -> UIViewController {
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let presenter : DetailPresenterProtocol = DetailPresenter()
        let wireframe : DetailWireframeProtocol = DetailWireframe()
        vc.presenter = presenter
        presenter.view = vc
        presenter.wireframe = wireframe
        return vc
    }
}
