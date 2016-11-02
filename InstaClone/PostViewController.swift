//
//  PostViewController.swift
//  InstaClone
//
//  Created by Mohamed Saeed on 11/2/16.
//  Copyright © 2016 kalamoni. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var locationTextView: UITextView!
    @IBOutlet var tagTextView: UITextView!
    @IBOutlet var captionTextView: UITextView!
    @IBOutlet var imageToPost: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captionTextView.delegate = self
        // Do any additional setup after loading the view.
        
        captionTextView.text = "Write a caption..."
        captionTextView.textColor = UIColor.gray
        locationTextView.textColor = UIColor.black
        tagTextView.textColor = UIColor.black
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(gesture:)))
        view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
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
    
    /**
     This method is used to dismiss the keyboard when touching the screen
     
     - parameter gesture: a reference to tapping on the screen
     */
    func tap(gesture: UITapGestureRecognizer) {
        captionTextView.resignFirstResponder()
        tagTextView.resignFirstResponder()
        locationTextView.resignFirstResponder()
    }
    
    
    
    
    /**
     This method is used to get the location of the user and print it to the location text view.
     
     - parameter sender: a reference to the button that has been touched
     */
    @IBAction func getLocation(_ sender: Any) {
        
    }
    
    
    
    /**
     This method is used to move the view above the keyboard to show the text field being written to.
     
     - parameter notification: an observer for the notification center
     */
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        
    }
    
    /**
     This method is used to return the view to normal after the keyboard is dismissed.
     
     - parameter notification: an observer for the notification center
     */
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
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
