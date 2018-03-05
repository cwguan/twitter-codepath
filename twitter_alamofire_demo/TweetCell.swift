//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweeterNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            retweetCountLabel.text = String(tweet.retweetCount)
            favoriteCountLabel.text = String(describing: tweet.favoriteCount)
            
            tweeterNameLabel.text = tweet.user.name
            usernameLabel.text = tweet.user.screenName
            
            dateLabel.text = tweet.createdAtString
            
            profileImageView.af_setImage(withURL: tweet.user.profileImageURL!)
        }
    }
    
    
    @IBAction func onRetweet(_ sender: Any) {
    }
    
    
    @IBAction func onFavorite(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
