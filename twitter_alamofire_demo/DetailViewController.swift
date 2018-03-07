//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Christopher Guan on 3/6/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {

    
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorUsernameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    var tweet: Tweet!
    
    
    @IBAction func onReply(_ sender: Any) {
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
                    self.retweetButton.setImage(#imageLiteral(resourceName: "retweet-icon-green"), for: .normal)
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
                    self.retweetButton.setImage(#imageLiteral(resourceName: "retweet-icon"), for: .normal)
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
                    self.favoriteButton.setImage(#imageLiteral(resourceName: "favor-icon-red"), for: .normal)
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
                    self.favoriteButton.setImage(#imageLiteral(resourceName: "favor-icon"), for: .normal)
                    self.refreshData()
                }
            }
        }
        self.refreshData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileURL = tweet.user.profileImageURL!
        authorImageView.af_setImage(withURL: profileURL)
        
        authorNameLabel.text = tweet.user.name
        authorUsernameLabel.text = "@" + tweet.user.screenName!
        
        tweetTextLabel.text = tweet.text
        
        dateLabel.text = tweet.createdAtString
        
        if (tweet.retweeted == true) {
            retweetButton.setImage(#imageLiteral(resourceName: "retweet-icon-green"), for: .normal)
        } else {
            retweetButton.setImage(#imageLiteral(resourceName: "retweet-icon"), for: .normal)
        }
        retweetCountLabel.text = String(tweet.retweetCount)


        if (tweet.favorited == true) {
            favoriteButton.setImage(#imageLiteral(resourceName: "favor-icon-red"), for: .normal)
        } else {
            favoriteButton.setImage(#imageLiteral(resourceName: "favor-icon"), for: .normal)
        }
        favoriteCountLabel.text = String(tweet.favoriteCount!)

    }

    
    func refreshData() {
        retweetCountLabel.text = String(tweet.retweetCount)
        favoriteCountLabel.text = String(tweet.favoriteCount!)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
