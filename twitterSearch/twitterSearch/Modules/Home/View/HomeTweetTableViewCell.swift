//
//  HomeTweetTableViewCell.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 9/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit
import Kingfisher
class HomeTweetTableViewCell: UITableViewCell {

    static let identifier = "SearchTweetTableViewCell"
    static let nibFile = UINib(nibName: "SearchTweetTableViewCell", bundle: Bundle.main)
    @IBOutlet weak var tweetTitle: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    var status : Status!{
        didSet{
            self.updateLayout()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateLayout(){
        self.tweetText.text = status.text
        self.tweetTitle.text = "@\(status.user.screenName)"
        self.retweetLabel.text = "\(status.retweetedCount)"
        self.favoriteLabel.text = "\(status.favoriteCount)"
        let url = URL(string : status.user.profileImageUrl)
        self.profileImageView.kf.setImage(with: url)
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width/2
        self.profileImageView.clipsToBounds = true
    }
}
