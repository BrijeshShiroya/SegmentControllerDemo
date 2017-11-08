//
//  CartCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/10/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet var stepper: GMStepper!
    @IBOutlet var viewMain: UIView!
    @IBOutlet var ViewExtra: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.stepper.buttonsFont = UIFont(name: "Avenir", size: 14.0)!
        self.stepper.labelFont = UIFont(name: "Avenir", size: 14.0)!
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
