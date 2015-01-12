//
//  DetailViewController.swift
//  FinalClassRoster
//
//  Created by chantel Frizzell on 12/10/14.
//  Copyright (c) 2014 Training. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var imageInDVC: UIImageView! = UIImageView()
    
    @IBOutlet weak var firstNameInDVC: UILabel! = UILabel()
    
    @IBOutlet weak var lastNameInDVC: UILabel! = UILabel()
    
    @IBOutlet weak var gitHubInDVC: UITextView! = UITextView()
    
    
    var selectedPersonData:NSDictionary = NSDictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("detailView loaded")
        var imageData = selectedPersonData.valueForKey("image") as NSData

        var newImage = UIImage(data: imageData)

        
        gitHubInDVC.userInteractionEnabled = false
        
        imageInDVC.image = newImage
        firstNameInDVC.text = selectedPersonData.objectForKey("firstName") as? String
        lastNameInDVC.text = selectedPersonData.objectForKey("lastName") as? String
        gitHubInDVC.text = selectedPersonData.objectForKey("gitHub") as? String
                

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
