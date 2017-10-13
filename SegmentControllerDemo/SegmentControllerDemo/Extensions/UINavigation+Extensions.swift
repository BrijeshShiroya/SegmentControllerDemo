//
//  UINavigation+Extensions.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/5/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController{
  //set navigationbar title
  func setTitle(strTitle:String){
    self.navigationBar.tintColor = UIColor.white
    let lblTitle = UILabel()
    lblTitle.text = strTitle
    lblTitle.textColor = UIColor.white
    lblTitle.font = UIFont.navigationBarFont
    lblTitle.numberOfLines = 0
    lblTitle.sizeToFit()
    self.topViewController?.navigationItem.titleView = lblTitle
    self.topViewController?.navigationController?.navigationBar.barTintColor = UIColor.darkGray
  }
}
