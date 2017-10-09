//
//  FilterSubCategoryCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/6/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class FilterSubCategoryCell: UITableViewCell {
  //MARK: - Outlets
  @IBOutlet var btnSubCategory: UIButton!
  
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
  func setFilterSubCategoryCell(dictionary:NSMutableDictionary){
    self.dicCurrent = dictionary    
    let currentState = dictionary[FilterKey.isSelected] as! Bool
    if currentState{
      self.btnSubCategory.isSelected = true
    }else{
      self.btnSubCategory.isSelected = false
    }
     self.btnSubCategory.setTitle(dictionary[FilterKey.FilterSubCategoryName] as? String, for: .normal)
  }
}
