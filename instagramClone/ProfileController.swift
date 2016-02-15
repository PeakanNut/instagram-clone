//
//  ProfileController.swift
//  instagramClone
//
//  Created by AnthonyAu on 2/15/16.
//  Copyright © 2016 anthonyau. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var postsLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let currentUser = Profile.currentUser {
            navigationController?.navigationBar.topItem?.title = currentUser.username
            self.postsLabel.text = "\(currentUser.posts.count)"
            self.followersLabel.text = "\(currentUser.followers.count)"
            self.followingLabel.text = "\(currentUser.following.count)"
            if let profPic = currentUser.picture {
                self.profilePicture.image = profPic
            }
        } else {
            print("no users logged in")
        }
    }
    
    @IBAction func editProfile(sender:AnyObject) {
        //do nothing
    }
}
