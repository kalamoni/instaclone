//
//  PostViewController.swift
//  InstaClone
//
//  Created by Mohamed Saeed on 11/2/16.
//  Copyright © 2016 kalamoni. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var captionTextView: UITextView!
    @IBOutlet var imageToPost: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captionTextView.delegate = self
        // Do any additional setup after loading the view.
        
        captionTextView.text = "Write a caption..."
        captionTextView.textColor = UIColor.gray
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(gesture:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if captionTextView.text == "Write a caption..." {
            captionTextView.text = ""
            captionTextView.textColor = UIColor.black
        }
        return true
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        if captionTextView.text.characters.count == 0 {
            captionTextView.text = "Write a caption..."
            captionTextView.textColor = UIColor.gray
            captionTextView.resignFirstResponder()
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if captionTextView.text.characters.count == 0 {
            captionTextView.text = "Write a caption..."
            captionTextView.textColor = UIColor.gray
            captionTextView.resignFirstResponder()
        }
    }
    
    func tap(gesture: UITapGestureRecognizer) {
        captionTextView.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
