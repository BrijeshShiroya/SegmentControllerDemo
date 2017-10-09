//
//  DealDetailVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/9/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

struct DealDetailKeys{
    static let dealImage:String = "dealImage"
    static let dealTitle:String = "dealTitle"
    static let dealRating:String = "dealRating"
    static let dealTime:String = "dealTime"
    static let dealDetail:String = "dealDetail"
    static let dealFinePrint:String = "dealFinePrint"
    static let dealOffers:String = "dealOffers"
    
    static let dealOfferMainTitle:String = "dealOfferMainTitle"
    static let dealOfferOtherTitle:String = "dealOfferOtherTitle"
    static let dealOfferPrice:String = "dealOfferPrice"
     static let dealOfferClosedPrice:String = "dealOfferClosedPrice"
    static let dealOfferDiscount:String = "dealOfferDiscount"
    static let dealOfferQuantity:String = "dealOfferQuantity"
}

class DealDetailVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet var imgDeal: UIImageView!
    @IBOutlet var headerView: UIView!
    @IBOutlet var tblDealDetail: UITableView!
    //MARK: - Variables
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setHeaderView()
        tblDealDetail.register(UINib(nibName: "DealDetailCollapsedCell", bundle: nil), forCellReuseIdentifier: "DealDetailCollapsedCell")
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Other functions
    func setHeaderView(){
        self.headerView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: CGFloat(255.00).getProprtionalHeight())
        self.imgDeal.image = UIImage.init(named: "room1.jpeg")
        self.tblDealDetail.tableHeaderView = self.headerView
    }
    
    
    func setDealDetailData(){
//       let dicMainData = NSMutableDictionary()
        
        //dicMainData
    }
    
    //MARK: - Actions
}


//MARK: - TableView Delegates -

extension DealDetailVC : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealDetailCollapsedCell", for: indexPath) as! DealDetailCollapsedCell
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}



