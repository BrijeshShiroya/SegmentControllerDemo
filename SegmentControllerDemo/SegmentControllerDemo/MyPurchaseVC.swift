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
    
    @IBOutlet var tblPurchaseActive: UITableView!
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
         tblPurchaseActive.register(UINib(nibName: "PurchaseActiveCell", bundle: nil), forCellReuseIdentifier: "PurchaseActiveCell")
        
//        let homeScrollVC = STORYBOARD_MAIN.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
//        self.addChildViewController(homeScrollVC)
//        homeScrollVC.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
//        self.containerView.addSubview(homeScrollVC.view)
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
//            let homeScrollVC = STORYBOARD_MAIN.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
//            self.addChildViewController(homeScrollVC)
//            homeScrollVC.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
//            self.containerView.addSubview(homeScrollVC.view)
        }else{
            let homeScrollVC = STORYBOARD_MYPURCHASE.instantiateViewController(withIdentifier: "MyPurchasePastVC") as! MyPurchasePastVC
            self.addChildViewController(homeScrollVC)
            homeScrollVC.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
            self.containerView.addSubview(homeScrollVC.view)
        }
    }
    //PurchaseActiveCell
}

//MARK: - TableView Delegates -

extension MyPurchaseVC : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseActiveCell", for: indexPath) as! PurchaseActiveCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//self.arrTitle.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172.5//CGFloat(170.5).getProprtionalHeight()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}




