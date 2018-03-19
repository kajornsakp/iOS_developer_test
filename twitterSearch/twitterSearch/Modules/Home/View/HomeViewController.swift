//
//  HomeViewController.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 11/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit
import PKHUD

class HomeViewController: UIViewController {

    var presenter: HomePresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var emptyView: UIView!
    @IBOutlet var searchBar: UISearchBar!
    
    //data source
    var statuses : [Status] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Twitter Search"
        
    }
    func setupTableView(){
        self.tableView.estimatedRowHeight = 300
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(HomeTweetTableViewCell.nibFile, forCellReuseIdentifier: HomeTweetTableViewCell.identifier)
        self.tableView.backgroundView = emptyView
    }
    
    @IBAction func didTapSearchButton(_ sender: Any) {
        searchBar.becomeFirstResponder()
    }
    
    
    
}


extension HomeViewController : HomeViewProtocol{
    
    func showTweets(_ statuses: [Status],isAppended : Bool) {
        if isAppended {
            self.statuses.append(contentsOf: statuses)
        }
        else{
            self.statuses = statuses
        }
        self.tableView.reloadData()
    }
    func showError(_ errorMessage: String) {
        HUD.flash(.labeledError(title: "Error", subtitle: errorMessage),delay : 1.0)
    }
    func showLoading() {
        HUD.show(.progress)
    }
    func hideLoading() {
        HUD.flash(.success,delay : 1.0)
    }
}


extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.statuses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTweetTableViewCell.identifier, for: indexPath) as! HomeTweetTableViewCell
        let status = statuses[indexPath.row]
        cell.status = status
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let status = statuses[indexPath.row]
        self.presenter?.pushToDetailScreen(status)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = statuses.count - 1
        if indexPath.row == lastElement {
             self.presenter?.loadMoreTweets()
        }
    }
}

extension HomeViewController : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let keyword = searchBar.text else {return}
        self.presenter?.searchTweet(keyword)
    }
}
