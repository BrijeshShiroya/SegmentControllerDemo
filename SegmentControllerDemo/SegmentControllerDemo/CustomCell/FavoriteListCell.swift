//
//  FavoriteListCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/4/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class FavoriteListCell: UITableViewCell {
    //MARK: - Outlets -
    @IBOutlet var ViewMain: UIView!
    @IBOutlet var btnBuy: AwfirButton!
    //MARK: - Variables -
    
    //MARK: - Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.ViewMain.layer.borderWidth = 2.0
        self.ViewMain.layer.borderColor = UIColor.darkGray.cgColor
        self.ViewMain.layer.cornerRadius = 10.0
        self.ViewMain.layer.masksToBounds = true
        self.btnBuy.layer.cornerRadius = 5.0
        self.btnBuy.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //MARK: - Other functions -
    
}
