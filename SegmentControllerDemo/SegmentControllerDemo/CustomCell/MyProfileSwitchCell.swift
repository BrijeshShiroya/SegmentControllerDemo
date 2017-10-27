//
//  MyProfileSwitchCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/27/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class MyProfileSwitchCell: UITableViewCell {
    //MARK :- Outlets
    @IBOutlet var `switch`: UISwitch!
    @IBOutlet var lblName: UILabel!
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
    func setMyProfileSwitchCell(dictionary:NSMutableDictionary){
        self.lblName.text = dictionary[MyProfileKey.fieldName] as? String
    }
}
