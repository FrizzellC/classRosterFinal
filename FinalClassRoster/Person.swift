//
//  Person.swift
//  FinalClassRoster
//
//  Created by chantel Frizzell on 12/14/14.
//  Copyright (c) 2014 Training. All rights reserved.
//

import Foundation
import UIKit

class Person :  NSCoding {
    
    var firstName = ""
    var lastName = ""
    var isStudent = true
    var image : UIImage?
    
    
    init(first : String, last : String, student : Bool) {
        self.firstName = first
        self.lastName = last
        self.isStudent = true
    }
    
    required init(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as String
        self.isStudent = aDecoder.decodeObjectForKey("isStudent") as Bool
        if let decodedImage = aDecoder.decodeObjectForKey("image") as? UIImage {
            self.image = decodedImage
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        aCoder.encodeObject(self.isStudent, forKey: "isStudent")
        if self.image != nil {
            aCoder.encodeObject(self.image!, forKey: "image")
        } else {
            aCoder.encodeObject(nil, forKey: "image")
        }
    }
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
        
    }
    
    
}

