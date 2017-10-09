//
//  FilterMainCategoryCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/6/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class FilterMainCategoryCell: UITableViewCell {
  //MARK: - Outlets
  @IBOutlet var lblFilterName: UILabel!

 //MARK: - Variables
  var dicCurrent:NSMutableDictionary? = nil
  
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
  func setFilterMainCategoryCell(dictionary:NSMutableDictionary){
      self.dicCurrent = dictionary
  }
    
}
