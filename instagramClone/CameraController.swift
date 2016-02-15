//
//  CameraController.swift
//  instagramClone
//
//  Created by AnthonyAu on 2/15/16.
//  Copyright © 2016 anthonyau. All rights reserved.
//

import UIKit

class CamerController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CaptionDelegate {
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var sourceLabel: UILabel!
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sourceLabel.text = "No Image Selected"
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        selectedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        self.selectedImageView.image = selectedImage
        if picker.sourceType == .Camera {
            sourceLabel.text = "photo"
        } else if picker.sourceType == .PhotoLibrary {
            sourceLabel.text = "library"
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func captionController(controller: CaptionController, didFinishWithCaption caption: String) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        let newPost = Post(creator: Profile.currentUser!.username, image: selectedImage, caption: caption)
        Post.feed!.append(newPost)
        Profile.currentUser!.posts.append(newPost)
        
        let tabBarController = self.presentingViewController as? UITabBarController
        tabBarController!.selectedIndex = 0
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! CaptionController
        destinationVC.selectedImage = selectedImage
        destinationVC.delegate = self
    }
    
    @IBAction func takePhoto(sender: UIButton!) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .Camera
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func selectPhoto(sender: UIButton!) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .PhotoLibrary
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func dismissPhotoPicker(sender: UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
