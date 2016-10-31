//
//  AuthenticationViewController.swift
//  InstaClone
//
//  Created by Mohamed Saeed on 10/31/16.
//  Copyright © 2016 kalamoni. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

class AuthenticationViewController: UIViewController, UIAlertViewDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        authenticateUser()
    }
    
    /**
     This method is used to skip touch id authentication
     
     - parameter sender: a reference to the button that has been touched
     
     - Remark: must be removed before going into production
     
     */
    @IBAction func skip(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToChat", sender: self)
    }
    
    
    /**
     This method gets called when the user taps on the Touch ID finger print button.
     
     - parameter sender: a reference to the button that has been touched
     */
    
    @IBAction func authenticateUser(_ sender: UIButton) {
        
        let authenticationContext = LAContext()
        var error:NSError?
        
        guard authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            showAlert(title: "Error", message: "This device does not have a TouchID sensor.")
            return
        }
        
        // Check the fingerprint
        authenticationContext.evaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            localizedReason: "Logging in with Touch ID",
            reply: { [unowned self] (success, error) -> Void in
                
                if(success) {
                    // Fingerprint recognized
                    self.performSegue(withIdentifier: "goToChat", sender: self)
                }else {
                    // Check if there is an error
                    if let error = error {
                        self.showAlert(title: "Error", message: error.localizedDescription)
                    }
                }
        })
    }
    
    
    /**
     This method presents an UIAlertViewController to the user.
     
     - parameter title: The title for the UIAlertViewController.
     - parameter message: The message for the UIAlertViewController.
     
     */
    func showAlert(title:String, message:String ) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertVC.addAction(okAction)
        
    }
    
}


