//
//  ListingCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/18/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit
import SDWebImage

class ListingCell: UITableViewCell {
    //MARK: - Outlets
    
    @IBOutlet var imgViewMain: UIImageView!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblSubtitle: UILabel!
    @IBOutlet var lblMainTitle: UILabel!
    @IBOutlet var imgView: UIImageView!
    //MARK: - Variables
    
    //MARK: - View Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - Other functions
    func setListingCellData(dictionary:NSMutableDictionary){
        
        self.imgViewMain.contentMode = .scaleAspectFill
        
        //   imgView2.sd_setImage(with: URL(string: url1), placeholderImage: UIImage(named: "room1"))
        
        imgViewMain.sd_setImage(with: URL(string: dictionary["imgUrl"] as! String), placeholderImage:  UIImage(named: "room1")) { (image, error, nil, url) in
            self.imgViewMain.image? = (self.imgViewMain.image?.scaleImageToSize(newSize: self.imgView.frame.size))!
            self.imgView.image = image
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.imgView.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.imgView.addSubview(blurEffectView)
        }
        
//        self.imgView.sd_setImage(with: URL.init(string: dictionary["imgUrl"] as! String), placeholderImage: UIImage.init(named: "room1"))
        self.lblDate.text = dictionary["date"] as? String
        self.lblSubtitle.text = dictionary["subTitle"] as? String
        self.lblMainTitle.text = dictionary["mainTitle"] as? String

    }
    
}
