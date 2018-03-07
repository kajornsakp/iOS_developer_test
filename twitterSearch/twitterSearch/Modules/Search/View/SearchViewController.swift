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
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        presenter?.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func registerTableView(){
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
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
        let cell = UITableViewCell()
        cell.textLabel?.text = statuses[indexPath.row].text
        return cell
    }
}
extension SearchViewController : SearchViewProtocol{
    
    func showTweets(with tweet: TweetModel) {
        self.tweet = tweet
        self.statuses = tweet.statuses
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
