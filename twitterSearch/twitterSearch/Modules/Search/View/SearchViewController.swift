//
//  SearchViewController.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit


class SearchViewController: UIViewController {
    
    var presenter : SearchPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    var tweet : TweetModel?
    var statuses : [Status] = []
    var refreshControl : UIRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        setupPullToRefresh()
        presenter?.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func registerTableView(){
        self.tableView.estimatedRowHeight = 300
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(SearchTweetTableViewCell.nibFile, forCellReuseIdentifier: SearchTweetTableViewCell.identifier)
    }
    
    func setupPullToRefresh(){
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refreshTweet), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func refreshTweet(){
        presenter?.refreshTweet()
    }
    
}
extension SearchViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.statuses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTweetTableViewCell.identifier, for: indexPath) as! SearchTweetTableViewCell
        let status = statuses[indexPath.row]
        cell.status = status
        return cell
    }
}
extension SearchViewController : SearchViewProtocol{
    
    func showTweets(with tweet: TweetModel) {
        self.tweet = tweet
        self.statuses = tweet.statuses
        self.refreshControl.endRefreshing()
        self.tableView.reloadData()
    }
    
    func showError(_ errorMessage: String) {
        print(errorMessage)
    }
    
    func showLoading() {
        print("loading")
    }
    
    func hideLoading() {
        print("hide loading")
    }
    
    
}
