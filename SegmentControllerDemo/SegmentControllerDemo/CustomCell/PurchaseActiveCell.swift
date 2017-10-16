//
//  PurchaseActiveCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/13/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class PurchaseActiveCell: UITableViewCell {
    //MARK :- Outlets 
    @IBOutlet var ViewMain: UIView!
    
    //MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.ViewMain.layer.borderWidth = 2.0
        self.ViewMain.layer.borderColor = UIColor.darkGray.cgColor
        self.ViewMain.layer.cornerRadius = 10.0
        self.ViewMain.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    //MARK: - Other functions -

    
}
