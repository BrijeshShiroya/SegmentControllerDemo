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
    
    let count = 20
    let arrSelectedSectionIndex = NSMutableArray()
    var isMultipleExpansionAllowed:Bool = true
    let dicMainData = NSMutableDictionary()
    var dealTitle = ""
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.setHeaderView()
        self.setDealDetailData()
        if !isMultipleExpansionAllowed{
            arrSelectedSectionIndex.add(NSNumber.init(value: count+2))
        }
        tblDealDetail.register(UINib(nibName: "DealDetailCollapsedCell", bundle: nil), forCellReuseIdentifier: "DealDetailCollapsedCell")
        tblDealDetail.register(UINib(nibName: "DealDetailExpandedCell", bundle: nil), forCellReuseIdentifier: "DealDetailExpandedCell")
        tblDealDetail.register(UINib(nibName: "DealOfferCell", bundle: nil), forCellReuseIdentifier: "DealOfferCell")
        //tblDealDetail.estimatedRowHeight = 80.0
        //        tblDealDetail.rowHeight = UITableViewAutomaticDimension
        //DealOfferCell
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    //MARK: - Other functions
    func setHeaderView(){
        self.headerView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: CGFloat(255.00).getProprtionalHeight())
        self.imgDeal.image = UIImage.init(named: "room1.jpeg")
        self.tblDealDetail.tableHeaderView = self.headerView
    }
    
    
    func setDealDetailData(){
        dicMainData[DealDetailKeys.dealTitle] = "Big and little Kuwait city"
        dicMainData[DealDetailKeys.dealImage] = "room1.jpeg"
        dicMainData[DealDetailKeys.dealRating] = "3.0"
        dicMainData[DealDetailKeys.dealDetail] = "This deal is very much fine deal, once you have to revire it thanks and thanks a lot.This deal is very much fine deal, once you have to revire it thanks and thanks a lot.This deal is very much fine deal, once you have to revire it thanks and thanks a lot.vThis deal is very much fine deal, once you have to revire it thanks and thanks a lot"
        dicMainData[DealDetailKeys.dealFinePrint] = "This deal is very much fine deal, once you have to revire it thanks and thanks a lot"
        
        let arrDealOffer = NSMutableArray()
        var dicDealOffer = NSMutableDictionary()
        dicDealOffer[DealDetailKeys.dealOfferMainTitle] = "Two loves it' sized italian meal"
        dicDealOffer[DealDetailKeys.dealOfferOtherTitle] = "Over 500 Boughts"
        dicDealOffer[DealDetailKeys.dealOfferPrice] = "130 KWD"
        dicDealOffer[DealDetailKeys.dealOfferClosedPrice] = "120 KWD"
        dicDealOffer[DealDetailKeys.dealOfferDiscount] = "35% Off"
        dicDealOffer[DealDetailKeys.dealOfferQuantity] = "5"
        arrDealOffer.add(dicDealOffer)
        
        dicDealOffer = NSMutableDictionary()
        dicDealOffer[DealDetailKeys.dealOfferMainTitle] = "Two loves it' sized italian meal"
        dicDealOffer[DealDetailKeys.dealOfferOtherTitle] = "Over 500 Boughts"
        dicDealOffer[DealDetailKeys.dealOfferPrice] = "130 KWD"
        dicDealOffer[DealDetailKeys.dealOfferClosedPrice] = "120 KWD"
        dicDealOffer[DealDetailKeys.dealOfferDiscount] = "35% Off"
        dicDealOffer[DealDetailKeys.dealOfferQuantity] = "5"
        arrDealOffer.add(dicDealOffer)
        
        dicDealOffer = NSMutableDictionary()
        dicDealOffer[DealDetailKeys.dealOfferMainTitle] = "Two loves it' sized italian meal"
        dicDealOffer[DealDetailKeys.dealOfferOtherTitle] = "Over 500 Boughts"
        dicDealOffer[DealDetailKeys.dealOfferPrice] = "130 KWD"
        dicDealOffer[DealDetailKeys.dealOfferClosedPrice] = "120 KWD"
        dicDealOffer[DealDetailKeys.dealOfferDiscount] = "35% Off"
        dicDealOffer[DealDetailKeys.dealOfferQuantity] = "5"
        arrDealOffer.add(dicDealOffer)
        
        dicMainData[DealDetailKeys.dealOffers] = arrDealOffer
        
        
        
    }
    
    //MARK: - Actions
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


//MARK: - TableView Delegates -

extension DealDetailVC : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //check dictionary contains any value
        if self.dicMainData.count != 0{
            if section == 0 || section == 1{
                if arrSelectedSectionIndex.contains(NSNumber.init(value: section)){
                    return 1
                }else{
                    return 0
                }
            }else{
                return (self.dicMainData[DealDetailKeys.dealOffers] as! NSMutableArray).count
            }
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 || indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DealDetailExpandedCell", for: indexPath) as! DealDetailExpandedCell
            if indexPath.section == 0{
                cell.lblExpanded.text = self.dicMainData[DealDetailKeys.dealDetail] as? String
            }else{
                cell.lblExpanded.text = self.dicMainData[DealDetailKeys.dealFinePrint] as? String
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DealOfferCell", for: indexPath) as! DealOfferCell
            cell.setDealOfferCell()
            cell.btnOfferSelect.tag = indexPath.row
            cell.btnOfferSelect.addTarget(self, action: #selector(self.btnOptionClick(_:)), for: .touchUpInside)
            return cell
        }
    }
    
    func btnOptionClick(_ sender:UIButton){
        if sender.isSelected{
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 || indexPath.section == 1{
            return UITableViewAutomaticDimension
        }else{
            return CGFloat(89.5).getProprtionalHeight()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 1{
            return CGFloat(44.0).getProprtionalHeight()
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealDetailCollapsedCell") as! DealDetailCollapsedCell
        if section == 0 {
            cell.btnExpand.setTitle(" Details", for: .normal)
        }else if section == 1{
            cell.btnExpand.setTitle(" Fineprint", for: .normal)
        }
        if arrSelectedSectionIndex.contains(NSNumber.init(value: section))
        {
            cell.btnExpand.isSelected = true
        }
        cell.btnExpand.tag = section
        cell.btnExpand.addTarget(self, action: #selector(self.btnTapShowHideSection(_:)), for: .touchUpInside)
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 || indexPath.section == 1{
            return UITableViewAutomaticDimension
        }else{
            return CGFloat(89.5).getProprtionalHeight()
        }
    }
    
    func btnTapShowHideSection(_ sender:UIButton){
        if !sender.isSelected{
            if  !isMultipleExpansionAllowed{
                self.arrSelectedSectionIndex.replaceObject(at: 0, with: NSNumber.init(value: sender.tag))
            }
            else{
                self.arrSelectedSectionIndex.add(NSNumber.init(value: sender.tag))
            }
            sender.isSelected = true
        }else{
            sender.isSelected = false
            if arrSelectedSectionIndex.contains(NSNumber.init(value: sender.tag)){
                arrSelectedSectionIndex.remove(NSNumber.init(value: sender.tag))
            }
        }
        if !isMultipleExpansionAllowed{
            UIView.transition(with: self.tblDealDetail, duration: 1.0, options: .curveLinear, animations: {self.tblDealDetail.reloadData()}, completion: nil)
        }else{
            tblDealDetail.reloadSections(NSIndexSet.init(index: sender.tag) as IndexSet, with: .automatic)
        }
    }
}



