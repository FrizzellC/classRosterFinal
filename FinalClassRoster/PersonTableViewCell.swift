//
//  PersonTableViewCell.swift
//  FinalClassRoster
//
//  Created by chantel Frizzell on 12/14/14.
//  Copyright (c) 2014 Training. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var firstNameInCell: UILabel!

    @IBOutlet weak var lastnameInCell: UILabel!
    
    @IBOutlet weak var imageInCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
