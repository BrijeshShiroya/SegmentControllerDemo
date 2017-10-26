//
//  MyPurchasePastVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/17/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit
import STPopup

class MyPurchasePastVC: UIViewController {
    //MARK: - Outlets -
    
    @IBOutlet var tblPurchasePastList: UITableView!
    //MARK: - Variables -

    //MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
      tblPurchasePastList.register(UINib(nibName: "PurchasePastCell", bundle: nil), forCellReuseIdentifier: "PurchasePastCell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - Other functions
    
    //MARK: - Actions
    
    func btnReviewDealClick(sender:UIButton){
        let vc = STORYBOARD_MAIN.instantiateViewController(withIdentifier: "AddReviewVC") as! AddReviewVC
        let width = SCREEN_WIDTH - 16
        vc.contentSizeInPopup = CGSize(width: width, height: CGFloat(245.0).proportionalSizeRelatedToOther(actualSize: 375.0, toRelatedSize: width))
        let stVC = STPopupController.init(rootViewController: vc)
        stVC.backgroundView?.backgroundColor = UIColor.clear
        stVC.navigationBar.tintColor = UIColor.lightGray
        stVC.navigationBar.backgroundColor = UIColor.lightGray
        stVC.style = .formSheet
        stVC.transitionStyle = .fade
        stVC.present(in: self)
    }
 
}
//MARK: - TableView Delegates -

extension MyPurchasePastVC : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchasePastCell", for: indexPath) as! PurchasePastCell
        cell.btnReviewDeal.addTarget(self, action: #selector(self.btnReviewDealClick(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//self.arrTitle.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(86.0).getProprtionalHeight()
    }
}

