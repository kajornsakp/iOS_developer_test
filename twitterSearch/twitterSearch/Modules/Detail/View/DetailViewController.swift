//
//  DetailViewController.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 13/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var presenter: DetailPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension DetailViewController : DetailViewProtocol{
    
}
