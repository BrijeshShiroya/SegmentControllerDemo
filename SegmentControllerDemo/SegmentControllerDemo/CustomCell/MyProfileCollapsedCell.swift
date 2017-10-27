//
//  MyProfileCollapsedCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/5/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class MyProfileCollapsedCell: UITableViewCell {
  //MARK: - Outlets -
  
  @IBOutlet var imgUser: UIImageView!
  @IBOutlet var btnExpand: UIButton!
  @IBOutlet var lblUserName: UILabel!
  @IBOutlet var lblName: UILabel!
  
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
    
    //MARK: - Other functions
    func setMyProfileCollapsedCell(dictionary:NSMutableDictionary){
        self.imgUser.image = UIImage.init(named: dictionary[MyProfileKey.fieldImage] as! String)
        self.lblName.text = dictionary[MyProfileKey.fieldName] as? String
        self.lblUserName.text = dictionary[MyProfileKey.value] as? String
        
    }
  
}
