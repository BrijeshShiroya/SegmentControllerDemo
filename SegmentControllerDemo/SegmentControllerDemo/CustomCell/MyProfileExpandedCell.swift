//
//  MyProfileExpandedCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/5/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class MyProfileExpandedCell: UITableViewCell {
  //MARK: - Outlets -
  
  @IBOutlet var txt: UITextField!
  
  //MARK: - Variables -
  
  //MARK: - Life cycle -
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
