//
//  RedViewController.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 9/26/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit
import STPopup


class RedViewController: UIViewController,AlertDelegate {
    //MARK: - Outlets
    @IBOutlet var imgView: UIImageView!
    //MARK: - Variables
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertSuccess(success: Bool) {
        if success{
            print("hello brijesh congratulation!! its come from red and success")
        }else{
            print("Sorry")
        }
    }
    
    
    
    
    //MARK: - Other functions
    
    //MARK: - Actions
    
    @IBAction func btnShowAlertClicked(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AlertVC") as! AlertVC
        vc.contentSizeInPopup = CGSize.init(width: 375, height: 150)
        vc.delegate = self
        vc.mainTitle = "Are you sure from awfir?"
        vc.btnAcceptTitle = "Yes why not?"
        vc.btnCancelTitle = "Ok"
        let stVC = STPopupController.init(rootViewController: vc)
        stVC.navigationBarHidden = true
        stVC.style = .formSheet
        stVC.transitionStyle = .fade
        stVC.present(in: self)
    }
}
