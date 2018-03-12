//
//  SearchViewController.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit
import PKHUD

class SearchViewController: UITableViewController {
    
    var presenter : SearchPresenterProtocol?
 
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.searchBar.delegate = self
        
    }
    
    
}

extension SearchViewController : SearchViewProtocol{
    
    
    func showError(_ errorMessage: String) {
        HUD.flash(.labeledError(title: "Error", subtitle: errorMessage), delay: 1.0)
        print(errorMessage)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.flash(.success, delay: 1.0)
    }
}

extension SearchViewController : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let keyword = searchBar.text else {return}
        self.presenter?.searchTweet(keyword)
    }
}
