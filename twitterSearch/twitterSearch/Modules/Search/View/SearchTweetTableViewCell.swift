//
//  SearchTweetTableViewCell.swift
//  twitterSearch
//
//  Created by Kajornsak Peerapathananont on 8/3/2561 BE.
//  Copyright © 2561 Kajornsak Peerapathananont. All rights reserved.
//

import UIKit

class SearchTweetTableViewCell: UITableViewCell {

    static let identifier = "\(self)"
    static let nibFile = UINib(nibName: "SearchTweetTableViewCell", bundle: Bundle.main)
    @IBOutlet weak var tweetTitle: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    var status : Status!{
        didSet{
            self.updateLayout()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateLayout(){
        self.tweetText.text = status.text
        self.tweetTitle.text = status.createdAt
        self.contentView.setNeedsLayout()
        self.contentView.layoutIfNeeded()
    }
}
