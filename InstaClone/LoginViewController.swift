//
//  LoginViewController.swift
//  InstaClone
//
//  Created by Mohamed Saeed on 10/31/16.
//  Copyright © 2016 kalamoni. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    
    
    /**
     This method is used to perform login checking and take the user to his/her newsfeed
     
     - parameter sender: a reference to the button that has been touched
     
     - Remark: it's just a placeholder for login for now. And it skip to newsfeed.
     
     */
    @IBAction func login(_ sender: Any) {
        self.performSegue(withIdentifier: "goToNewsfeed", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(gesture:)))
        view.addGestureRecognizer(tapGesture)
        
        loginButton.layer.cornerRadius = 5
        
        let colors: [UIColor] = [UIColor(red: 138/255, green: 58/255, blue: 185/255, alpha: 1),
                                 UIColor(red: 76/255, green: 104/255, blue: 215/255, alpha: 1),
                                 UIColor(red: 205/255, green: 72/255, blue: 107/255, alpha: 1),
                                 UIColor(red: 251/255, green: 173/255, blue: 80/255, alpha: 1),
                                 UIColor(red: 252/255, green: 204/255, blue: 99/255, alpha: 1),
                                 UIColor(red: 188/255, green: 42/255, blue: 141/255, alpha: 1),
                                 UIColor(red: 233/255, green: 89/255, blue: 80/255, alpha: 1)]
        
        
        // animating the background colors of the login view
        
        UIView.animate(withDuration: 3, delay: 0, options: [.allowUserInteraction, .repeat, .autoreverse],
                       animations: {() -> Void in
                        self.view.backgroundColor = colors[0]
        },
                       completion: { (Bool) -> Void in
                        UIView.animate(withDuration: 3, delay: 0, options: [.allowUserInteraction, .repeat, .autoreverse],
                                       animations: { () -> Void in
                                        self.view.backgroundColor = colors[1]
                        }, completion:
                            
                            { (Bool) -> Void in
                                UIView.animate(withDuration: 3, delay: 0, options: [.allowUserInteraction, .repeat, .autoreverse],
                                               animations: { () -> Void in
                                                self.view.backgroundColor = colors[2]
                                }, completion:
                                    
                                    { (Bool) -> Void in
                                        UIView.animate(withDuration: 3, delay: 0, options: [.allowUserInteraction, .repeat, .autoreverse],
                                                       animations: { () -> Void in
                                                        self.view.backgroundColor = colors[3]
                                        }, completion:
                                            
                                            { (Bool) -> Void in
                                                UIView.animate(withDuration: 3, delay: 0, options: [.allowUserInteraction, .repeat, .autoreverse],
                                                               animations: { () -> Void in
                                                                self.view.backgroundColor = colors[4]
                                                }, completion:
                                                    
                                                    { (Bool) -> Void in
                                                        UIView.animate(withDuration: 3, delay: 0, options: [.allowUserInteraction, .repeat, .autoreverse],
                                                                       animations: { () -> Void in
                                                                        self.view.backgroundColor = colors[5]
                                                        }, completion:
                                                            
                                                            { (Bool) -> Void in
                                                                UIView.animate(withDuration: 3, delay: 0, options: [.allowUserInteraction, .repeat, .autoreverse],
                                                                               animations: { () -> Void in
                                                                                self.view.backgroundColor = colors[6]
                                                                }, completion:nil
                                                                    
                                                                )}
                                                            
                                                        )}
                                                    
                                                )}
                                            
                                        )}
                                    
                                )}
                            
                        )}
        )
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    func tap(gesture: UITapGestureRecognizer) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
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
