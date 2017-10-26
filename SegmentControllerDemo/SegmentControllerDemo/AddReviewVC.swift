//
//  AddReviewVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/26/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class AddReviewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let width = SCREEN_WIDTH - 16
        self.contentSizeInPopup = CGSize(width: width, height: CGFloat(245.0).proportionalSizeRelatedToOther(actualSize: 375.0, toRelatedSize: width))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
