//
//  PostViewController.swift
//  InstaClone
//
//  Created by Mohamed Saeed on 11/2/16.
//  Copyright © 2016 kalamoni. All rights reserved.
//

import UIKit
import CoreLocation

class PostViewController: UIViewController, UITextViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var locationTextView: UITextView!
    @IBOutlet var tagTextView: UITextView!
    @IBOutlet var captionTextView: UITextView!
    @IBOutlet var imageToPost: UIImageView!
    
    var manager:CLLocationManager = CLLocationManager()
    
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
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        
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
     This method is used to get the location of the user and print it to the location text view by resuming to monitor user location.
     
     - parameter sender: a reference to the button that has been touched
     */
    @IBAction func getLocation(_ sender: Any) {
        manager.startUpdatingLocation()
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
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let alert = UIAlertController(title: "Warning", message: "Error while updating location: \(error.localizedDescription)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0]
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
            
            if (error != nil) {
                
                let alert = UIAlertController(title: "Warning", message: "Error while updating location: \(error?.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                
            } else {
                
                if (placemarks?.count)! > 0 {
                    let p = (placemarks?[0])! as CLPlacemark
                    
                    let subThoroughfare = (p.subThoroughfare != nil) ? (p.subThoroughfare! + ",") : ""
                    let thoroughfare = (p.thoroughfare != nil) ? (p.thoroughfare! + ",") : ""
                    let subLocality = (p.subLocality != nil) ? (p.subLocality! + ",") : ""
                    let subAdministrativeArea = (p.subAdministrativeArea != nil) ? (p.subAdministrativeArea! + ",") : ""
                    let postalCode = (p.postalCode != nil) ? (p.postalCode! + ",") : ""
                    let country = (p.country != nil) ? p.country! : ""
                    
                    self.locationTextView
                        .text = "\(subThoroughfare) \(thoroughfare) \(subLocality) \(subAdministrativeArea) \(postalCode)\(country)"
                } else {
                    
                    let alert = UIAlertController(title: "Warning", message: "Error in GeoCoder: \(error?.localizedDescription)", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
            }
        })
        manager.stopUpdatingLocation()
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
