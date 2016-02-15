//
//  ProfileModel.swift
//  instagramClone
//
//  Created by AnthonyAu on 2/15/16.
//  Copyright © 2016 anthonyau. All rights reserved.
//

import UIKit

class Profile {
    let username: String
    var followers: [String]
    var following: [String]
    var posts: [Post]
    var picture: UIImage?
    static var currentUser: Profile?
    
    init(username: String, followers: [String], following: [String], posts: [Post], picture: UIImage?) {
        self.username = username
        self.followers = followers
        self.following = following
        self.posts = posts
        self.picture = picture
    }
    
    static func createUser(username: String) -> Profile {
            return Profile(username: username, followers: [], following: [], posts: [], picture: nil)
    }

}