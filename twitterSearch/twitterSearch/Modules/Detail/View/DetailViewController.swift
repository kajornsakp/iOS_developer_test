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
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var retweetedCountLabel: UILabel!
    @IBOutlet weak var favoritedCountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}

extension DetailViewController : DetailViewProtocol{
    func showTweetDetail(_ status: Status) {
        let url = URL(string : status.user.profileImageUrl ?? "")
        self.profileImageView.kf.setImage(with: url)
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width/2
        self.profileImageView.clipsToBounds = true
        self.usernameLabel.text = "@\(status.user.screenName ?? "")"
        self.screennameLabel.text = status.user.name ?? ""
        self.retweetedCountLabel.text = "\(status.retweetedCount)"
        self.favoritedCountLabel.text = "\(status.favoriteCount)"
        self.tweetTextLabel.text = status.text
        self.timestampLabel.text = status.createdAt
    }
}


