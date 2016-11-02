//
//  CameraViewController.swift
//  InstaClone
//
//  Created by Mohamed Saeed on 11/1/16.
//  Copyright © 2016 kalamoni. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet var imageToPost: UIImageView!
    
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        imageToPost.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     This method is used to pick up a photo from the user photo library
     
     - parameter sender: a reference to the button that has been touched
     */
    @IBAction func pickPhoto(_ sender: Any) {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    /**
     This method is used to open the camera and it shows an alert if camera not available
     
     - parameter sender: a reference to the button that has been touched
     */
    @IBAction func openCamera(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            picker.sourceType = UIImagePickerControllerSourceType.camera;
            picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Warning", message: "Camera is not available", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)

        }
    }
    
    /**
     This method is used to proceed with posting the image. And checks whether the user selected one. if not, it shows an alert telling him to pick one to proceed
     
     - parameter sender: a reference to the button that has been touched
     */
    @IBAction func proceedToPost(_ sender: Any) {
        if imageToPost.image != nil {
        self.performSegue(withIdentifier: "goToPost", sender: self)
        } else {
            let alert = UIAlertController(title: "Warning", message: "Please select an image first", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    /**
     This method is used to remove the selected image
     
     - parameter sender: a reference to the button that has been touched
     */
    @IBAction func removePhoto(_ sender: Any) {
        imageToPost.image = nil
    }
    
    
    /**
     This method is used to unwind the segue to this view controller
     
     - parameter segue: a reference to the segue used
     */
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
    }
    
    //MARK: - Delegates for UIImagePickerControllerDelegate
    
    /**
     This method is a delegate for UIImagePickerControllerDelegate to handle the selected image and show it

     */
    func imagePickerController(_ picker: UIImagePickerController,
                                        didFinishPickingMediaWithInfo info: [String : AnyObject]){
        let chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        imageToPost.contentMode = .scaleAspectFill
        imageToPost.image = chosenImage
        dismiss(animated:true, completion: nil)
        
    }
    
    /**
     This method is a delegate for UIImagePickerControllerDelegate to handle the cancelation of the picker view
     
     */
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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
