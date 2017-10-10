//
//  DealOfferCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/10/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class DealOfferCell: UITableViewCell {
    //MARK: - Outlets
    
    @IBOutlet var stepperOffer: GMStepper!
    @IBOutlet var lblDiscount: UILabel!
    @IBOutlet var lblOfferOtherTitle: AwfirLabel!
    @IBOutlet var lblOfferPrice: AwfirLabel!
    @IBOutlet var lblOfferClosedPrice: AwfirLabel!
    @IBOutlet var lblOfferTitle: AwfirLabel!
    @IBOutlet var btnOfferSelect: UIButton!
    
    //MARK: - Variables
    
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
    func setDealOfferCell(){
        
    }
    
}
