//
//  CategoryListCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/4/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class CategoryListCell: UITableViewCell {

  //MARK :- Outlets -
  @IBOutlet var lblDiscount: AwfirLabel!
  @IBOutlet var lblPrice: AwfirLabel!
  @IBOutlet var lblTitle: AwfirLabel!
  @IBOutlet var lblClosePrice: AwfirLabel!
  @IBOutlet var imgCategory: UIImageView!
  @IBOutlet var btnFavorite: AwfirButton!
  @IBOutlet var viewRating: FloatRatingView!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "120 KWD")
        attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
        self.lblClosePrice.attributedText = attributeString
        // Configure the view for the selected state
    }
  
  //MARK: - Other functions -
  
  func setCategoryListCellData(dicCurrent:NSMutableDictionary){
    self.lblPrice.text = "\(dicCurrent[ApiKey.dealPrice] as! String) KWD"
    self.imgCategory.image = UIImage.init(named: dicCurrent[ApiKey.dealImage] as! String)
    self.lblDiscount.text = "\(dicCurrent[ApiKey.dealDiscount] as! String) % Off"
    self.lblTitle.text = dicCurrent[ApiKey.dealTitle] as? String
    self.viewRating.rating = Double((dicCurrent[ApiKey.dealRating] as! String))!
    self.lblClosePrice.attributedText = self.setLiningLabelText(txt: "\(String(describing: dicCurrent[ApiKey.dealTitle] as? String)) KWD")
    self.btnFavorite.isSelected = dicCurrent[ApiKey.dealIsFav] as! Bool
  }
  
  func setLiningLabelText(txt:String) -> NSMutableAttributedString{
    let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: txt)
    attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
    return attributeString
  }
 
    
}
