//
//  AwfirLabel.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/5/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import UIKit

class AwfirLabel : UILabel {
    
    
    
    @IBInspectable var iPhoneFontSize:CGFloat = 0 {
        didSet {
            overrideFontSize(fontSize: iPhoneFontSize)
        }
    }

    func overrideFontSize(fontSize:CGFloat){
        let currentFontName = self.font.fontName
        var calculatedFont: UIFont?
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        switch height {
        case 568.0: //iphone 5, 5s SE => 4 inch
            calculatedFont = UIFont(name: currentFontName, size: fontSize)
            self.font = calculatedFont
            break
        case 667.0: //iphone 6, 6s 7 7 => 4.7 inch
            calculatedFont = UIFont(name: currentFontName, size: fontSize * 1.35)
            self.font = calculatedFont
            break
        case 736.0: //iphone 6s+ 6+ 7+  8+ => 5.5 inch
            calculatedFont = UIFont(name: currentFontName, size: fontSize * 1.50)
            self.font = calculatedFont
            break
        case 812.0: //iphone 10 => 5.5 inch
            calculatedFont = UIFont(name: currentFontName, size: fontSize * 1.50)
            self.font = calculatedFont
            break
        default:
            print("not an iPhone")
            break
        }
    }
    
}
