//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    var name: String?
    var screenName: String?
    var followerCount: Int?
    var followingCount: Int?
    var tweetCount: Int?
    var profileImageURL: URL?
    static var current: User?
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        
        tweetCount = dictionary["statuses_count"] as? Int
        followerCount = dictionary["followers_count"] as? Int
        followingCount = dictionary["friends_count"] as? Int
        
        let urlString = dictionary["profile_image_url"] as? String
        profileImageURL = URL(string: urlString!)!

    }
}
