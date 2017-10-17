//
//  RedViewController.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 9/26/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit
import STPopup
import SDWebImage


class RedViewController: UIViewController,AlertDelegate {
    //MARK: - Outlets
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    //MARK: - Variables
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let bottomViewFrame  = self.imgView.frame
        let url1 = "https://i.pinimg.com/736x/eb/c8/fb/ebc8fb3971bd50c666a167d524d8f5ba--portrait-photography-men-men-portrait.jpg"
        let url2 = "https://www.learnupon.com/wp-content/uploads/how-customers-love-LU-750x300.jpg"
        let url3 = "http://stuffershack.com/wp-content/uploads/2014/04/Fantasy-Barbarian-414x165.png"
        
        self.imgView2.contentMode = .scaleAspectFill
        
     //   imgView2.sd_setImage(with: URL(string: url1), placeholderImage: UIImage(named: "room1"))
        
        imgView2.sd_setImage(with: URL(string: url3), placeholderImage:  UIImage(named: "room1")) { (image, error, nil, url) in
            self.imgView2.image? = (self.imgView2.image?.scaleImageToSize(newSize: self.imgView.frame.size))!
            self.imgView.image = self.imgView2.image
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.imgView.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.imgView.addSubview(blurEffectView)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //delegate alert delegate
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
