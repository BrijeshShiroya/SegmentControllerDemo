//
//  SubCategoryCollapsedCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/6/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class SubCategoryCollapsedCell: UITableViewCell {
  //MARK: - Outlets -
  @IBOutlet var lblTitle: AwfirLabel!
  @IBOutlet var btnExpand: UIButton!
  
  //MARK: - Life cycle -
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  //MARK: - Other functions -
}
