//
//  MyPurchaseVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/10/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class MyPurchaseVC: UIViewController {
    
    //MARK: - Outlets -
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var segmentView: UIView!
    //MARK: - Variables -
    
    //MARK: - Life cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setTitle(strTitle: "My Purchase")
        self.navigationController?.isNavigationBarHidden = false
        self.segmentControl.selectedSegmentIndex = 0
        
        let homeScrollVC = STORYBOARD_MAIN.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
        self.addChildViewController(homeScrollVC)
        homeScrollVC.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
        self.containerView.addSubview(homeScrollVC.view)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Other functions -
    
    //MARK: - Actions -
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        let viewControllers:[UIViewController] = self.childViewControllers
        for viewContoller in viewControllers{
            viewContoller.willMove(toParentViewController: nil)
            viewContoller.view.removeFromSuperview()
            viewContoller.removeFromParentViewController()
        }
        if sender.selectedSegmentIndex == 0{
            let homeScrollVC = STORYBOARD_MAIN.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
            self.addChildViewController(homeScrollVC)
            homeScrollVC.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
            self.containerView.addSubview(homeScrollVC.view)
        }else{
//            self.containerView.backgroundColor = UIColor.blue
            let homeScrollVC = STORYBOARD_MAIN.instantiateViewController(withIdentifier: "CartVC") as! CartVC
            self.addChildViewController(homeScrollVC)
            homeScrollVC.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
            self.containerView.addSubview(homeScrollVC.view)
        }
    }
}


