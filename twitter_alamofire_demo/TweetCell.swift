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

    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            
            if (tweet.retweeted == true) {
                retweetButton.setTitle("Un-Retweet", for: .normal)
            } else {
                retweetButton.setTitle("Retweet", for: .normal)
            }
            retweetCountLabel.text = String(tweet.retweetCount)
            
            
            if (tweet.favorited == true) {
                favoriteButton.setTitle("Un-Favorite", for: .normal)
            } else {
                favoriteButton.setTitle("Favorite", for: .normal)
            }
            favoriteCountLabel.text = String(tweet.favoriteCount!)
            
            tweeterNameLabel.text = tweet.user.name
            usernameLabel.text = "@" + tweet.user.screenName!
            
            dateLabel.text = tweet.createdAtString
            
            let profileURL = tweet.user.profileImageURL!
            profileImageView.af_setImage(withURL: profileURL)
        }
    }
    
    
    @IBAction func onRetweet(_ sender: Any) {
        if (tweet.retweeted != true) {
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error retweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully retweeted the following Tweet: \n\(tweet.text)")
                    self.tweet.retweeted = true
                    self.tweet.retweetCount += 1
                    self.retweetButton.setTitle("Un-Retweet", for: .normal)
                    self.refreshData()
                }
            }
            
        } else {
            APIManager.shared.unretweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error un-retweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully un-retweeted the following Tweet: \n\(tweet.text)")
                    self.tweet.retweeted = false
                    self.tweet.retweetCount -= 1
                    self.retweetButton.setTitle("Retweet", for: .normal)
                    self.refreshData()
                }
            }
        }
        self.refreshData()
    }
    
    
    @IBAction func onFavorite(_ sender: Any) {
        if (tweet.favorited != true) {
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                    self.tweet.favorited = true
                    self.tweet.favoriteCount! += 1
                    self.favoriteButton.setTitle("Unfavorite", for: .normal)
                    self.refreshData()
                }
            }
            
        } else {
            APIManager.shared.unfavorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unfavoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                    self.tweet.favorited = false
                    self.tweet.favoriteCount! -= 1
                    self.favoriteButton.setTitle("Favorite", for: .normal)
                    self.refreshData()
                }
            }
        }
        self.refreshData()
    }
    
    
    func refreshData() {
        retweetCountLabel.text = String(tweet.retweetCount)
        favoriteCountLabel.text = String(tweet.favoriteCount!)
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
