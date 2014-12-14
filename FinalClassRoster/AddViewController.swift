//
//  AddViewController.swift
//  FinalClassRoster
//
//  Created by chantel Frizzell on 12/10/14.
//  Copyright (c) 2014 Training. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var firstNameTextField: UITextField! = UITextField()
    
    @IBOutlet weak var lastNameTextField: UITextField! = UITextField()
    
    @IBOutlet weak var gitHubTextField: UITextField! = UITextField()
    
    @IBAction func updateImageClicked(sender: AnyObject) {
        println("update image tapped")
        
        
//        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
//                var imagePickerController = UIImagePickerController()
//                self.imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
//                self.imagePickerController.delegate = self
//                self.imagePickerController.allowsEditing = true
//         //       self.presentViewController(self.imagePickerController, animated: true, completion: nil)
//            }
//        
//        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
//            let image = info[UIImagePickerControllerEditedImage] as UIImage
//            //            self.selectedPerson.image = image
//            //            self.imageView.image = image
//            
//            self.dismissViewControllerAnimated(true, completion: nil)
//        }

    }

        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //removal of keyboard
        func textFieldShouldReturn(textField: UITextField) -> Bool {
            
            if (textField == self.firstNameTextField) {
                textField.resignFirstResponder()
                lastNameTextField.becomeFirstResponder()
            } else if (textField == self.lastNameTextField) {
                textField.resignFirstResponder()
                gitHubTextField.becomeFirstResponder()
            } else if (textField == self.gitHubTextField) {
                textField.resignFirstResponder()
                return true
                
            }
            return true
    }
    
    @IBAction func saveChangesClicked(sender: AnyObject) {
        println("save changes tapped")
        
        //create the user's default view each time the app reopens
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var roster:NSMutableArray? = userDefaults.objectForKey("roster") as? NSMutableArray
        
        //create the dictionary for default view
        var dataSet:NSMutableDictionary = NSMutableDictionary()
        
        //add the default data to the data set
        dataSet.setObject(firstNameTextField.text, forKey: "firstName")
        dataSet.setObject(lastNameTextField.text, forKey: "lastName")
        dataSet.setObject(gitHubTextField.text, forKey: "gitHub")
        
        if ((roster) != nil) { //data is available
            
            //create a new roster array and delete the old one
            var newMutableRoster:NSMutableArray = NSMutableArray()
            
            for dict:AnyObject in roster! {
                newMutableRoster.addObject(dict as NSDictionary)
            }
            
            userDefaults.removeObjectForKey("roster")
            newMutableRoster.addObject(dataSet)
            userDefaults.setObject(newMutableRoster, forKey: "roster")
            
        
        } else {
              userDefaults.removeObjectForKey("roster")
              //initialize the roster
              roster = NSMutableArray()
            
              //add an object (the data set) to it
              roster!.addObject(dataSet)
            
              //save the newly added object so it will be there next time the app opens
              userDefaults.setObject(roster, forKey: "roster")
          }
        
        //save the changes
        userDefaults.synchronize()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
