//
//  dealCollectionCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 9/29/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class dealCollectionCell: UICollectionViewCell {
  //MARK: - Outlets -
  @IBOutlet var imgDeal: UIImageView!
  @IBOutlet var lblPrice: AwfirLabel!
  @IBOutlet var lblDiscount: AwfirLabel!
  @IBOutlet var lblDealDescription: AwfirLabel!
  @IBOutlet var btnFav: AwfirButton!
  @IBOutlet var dealRatingView: FloatRatingView!
  //MARK: - variables -
  
  //MARK: - Life cycle -
  override func awakeFromNib() {
    super.awakeFromNib()
    self.lblDealDescription.numberOfLines = 2
    // Initialization code
  }
  
  //MARK: - Other function -
  
  func setDealData(dicCurrent:NSMutableDictionary){
    self.lblPrice.text = "\(dicCurrent[ApiKey.dealPrice] as! String) KWD"
    self.imgDeal.image = UIImage.init(named: dicCurrent[ApiKey.dealImage] as! String)
    self.lblDiscount.text = "\(dicCurrent[ApiKey.dealDiscount] as! String) % Off"
    self.lblDealDescription.text = dicCurrent[ApiKey.dealTitle] as? String
    self.dealRatingView.rating = Double((dicCurrent[ApiKey.dealRating] as! String))!
    self.btnFav.isSelected = dicCurrent[ApiKey.dealIsFav] as! Bool
  }
}


