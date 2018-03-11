//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Christopher Guan on 3/10/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userUsernameLabel: UILabel!
    
    @IBOutlet weak var tweetCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!

    var user: User = User.current!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userLabel.text = user.name
        userUsernameLabel.text = "@" + user.screenName!
        
        tweetCountLabel.text = String(user.tweetCount!)
        followerCountLabel.text = String(user.followerCount!)
        followingCountLabel.text = String(user.followingCount!)
    
        
        let profileURL = user.profileImageURL!
        userProfileImageView.af_setImage(withURL: profileURL)
        
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
