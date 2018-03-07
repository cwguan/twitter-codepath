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
    
    var tweet: Tweet!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextLabel.text = tweet.text
//        if (tweet.retweeted == true) {
//            retweetButton.setTitle("Un-Retweet", for: .normal)
//        } else {
//            retweetButton.setTitle("Retweet", for: .normal)
//        }
//        retweetCountLabel.text = String(tweet.retweetCount)
//
//
//        if (tweet.favorited == true) {
//            favoriteButton.setTitle("Un-Favorite", for: .normal)
//        } else {
//            favoriteButton.setTitle("Favorite", for: .normal)
//        }
//        favoriteCountLabel.text = String(tweet.favoriteCount!)
        
        authorNameLabel.text = tweet.user.name
        authorUsernameLabel.text = "@" + tweet.user.screenName!
        
//        dateLabel.text = tweet.createdAtString
        
        let profileURL = tweet.user.profileImageURL!
        authorImageView.af_setImage(withURL: profileURL)

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
