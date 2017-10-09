//
//  ViewMoreVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/3/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class ViewMoreVC: UIViewController {

  @IBOutlet var btnClose: UIButton!
  override func viewDidLoad() {
        super.viewDidLoad()
    self.contentSizeInPopup = CGSize(width: 375, height: 500)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  
  @IBAction func btnCloseClicked(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
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
