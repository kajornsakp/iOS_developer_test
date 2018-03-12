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
    
    //data source
    var statuses : [Status] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
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
        presenter?.showSearchModule()
    }
    
}


extension HomeViewController : HomeViewProtocol{
    
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
}
