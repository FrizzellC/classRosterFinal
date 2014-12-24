//
//  AddViewController.swift
//  FinalClassRoster
//
//  Created by chantel Frizzell on 12/10/14.
//  Copyright (c) 2014 Training. All rights reserved.
//

import UIKit


class AddViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var imagePickerController = UIImagePickerController()

    
    @IBOutlet weak var firstNameTextField: UITextField! = UITextField()
    
    @IBOutlet weak var lastNameTextField: UITextField! = UITextField()
    
    @IBOutlet weak var gitHubTextField: UITextField! = UITextField()
    
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

    
    @IBOutlet weak var personImage: UIImageView!
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerEditedImage] as UIImage
        self.personImage.image = image
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func updateImageClicked(sender: AnyObject) {
        println("update image tapped")
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            var imagePickerController = UIImagePickerController()
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
            self.imagePickerController.delegate = self
            self.imagePickerController.allowsEditing = true
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
        } else if  UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            var imagePickerController = UIImagePickerController()
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.imagePickerController.delegate = self
            self.imagePickerController.allowsEditing = true
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        println("addview loaded")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveChangesClicked(sender: AnyObject) {
        println("save changes tapped")
        
        //create the user's default view each time the app reopens
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var people:NSMutableArray? = userDefaults.objectForKey("roster") as? NSMutableArray
        
        //create the dictionary for default view
        var dataSet:NSMutableDictionary = NSMutableDictionary()
        
        //add the default data to the data set
        dataSet.setObject(firstNameTextField.text, forKey: "firstName")
        dataSet.setObject(lastNameTextField.text, forKey: "lastName")
        dataSet.setObject(gitHubTextField.text, forKey: "gitHub")
//        dataSet.setObject(personImage.image!, forKey: "image")
        
        
        if ((people) != nil) { //data is available
            
            //create a new roster array and delete the old one
            var newMutableRoster:NSMutableArray = NSMutableArray()
            
            for dict:AnyObject in people! {
                newMutableRoster.addObject(dict as NSDictionary)
            }
            
            userDefaults.removeObjectForKey("roster")
            newMutableRoster.addObject(dataSet)
            userDefaults.setObject(newMutableRoster, forKey: "roster")
            
        
        } else {
              userDefaults.removeObjectForKey("roster")
              //initialize the roster
              people = NSMutableArray()
            
              //add an object (the data set) to it
              people!.addObject(dataSet)
            
              //save the newly added object so it will be there next time the app opens
              userDefaults.setObject(people, forKey: "roster")
          }
        
        //save the changes
        userDefaults.synchronize()
        
        self.navigationController?.popViewControllerAnimated(true)
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
