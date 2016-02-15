//
//  CaptionController.swift
//  instagramClone
//
//  Created by AnthonyAu on 2/15/16.
//  Copyright © 2016 anthonyau. All rights reserved.
//

import UIKit

protocol CaptionDelegate {
    func captionController(controller: CaptionController, didFinishWithCaption caption: String)
}

class CaptionController: UIViewController {
    @IBOutlet weak var captionText: UITextView!
    @IBOutlet weak var imagePreview: UIImageView!
    var selectedImage: UIImage!
    var delegate: CaptionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePreview.image = selectedImage
    }
    
    @IBAction func submitPressed(sender: UIButton!) {
        if let CaptionDelegate  = self.delegate {
            CaptionDelegate.captionController(self, didFinishWithCaption: captionText.text)
        }
    }
    
    @IBAction func backPressed(sender: UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func tap(sender: UITapGestureRecognizer!) {
        captionText.resignFirstResponder()
    }
}
