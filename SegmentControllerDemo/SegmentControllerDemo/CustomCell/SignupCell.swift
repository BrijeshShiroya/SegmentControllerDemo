//
//  SignupCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/17/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class SignupCell: UITableViewCell {
    //MARK :- Outlets
    
    @IBOutlet var lblPlaceholderTitle: AwfirLabel!
    @IBOutlet var txtSignup: UITextField!
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Other functions
}
