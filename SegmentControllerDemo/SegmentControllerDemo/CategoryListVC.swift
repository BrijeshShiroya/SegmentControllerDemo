//
//  CategoryListVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/4/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit
import EasyTransition
import STPopup


class CategoryListVC: UIViewController,SortByDelegate {
    //MARK: - Outlets -
    
    @IBOutlet var btnSortBy: UIButton!
    @IBOutlet var btnFilter: UIButton!
    @IBOutlet var filterView: UIView!
    @IBOutlet var tblCategoryList: UITableView!
    //MARK: - Variables -
    
    var arrDealList:NSMutableArray = NSMutableArray()
    var transition: EasyTransition?
    var strCategoryName:String = ""
    
    //MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        tblCategoryList.register(UINib(nibName: "CategoryListCell", bundle: nil), forCellReuseIdentifier: "CategoryListCell")
        self.setupNavigationBar(isLeft: false, isRightFirst: true, isRightSecond: true)
        self.navigationController?.setTitle(strTitle: strCategoryName)
        setData()
        self.btnSortBy.layer.borderWidth = 2.0
        self.btnSortBy.layer.borderColor = UIColor.darkGray.cgColor
        self.btnSortBy.layer.cornerRadius = 5.0
        self.btnSortBy.layer.masksToBounds = true
        
        self.btnFilter.layer.borderWidth = 2.0
        self.btnFilter.layer.borderColor = UIColor.darkGray.cgColor
        self.btnFilter.layer.cornerRadius = 5.0
        self.btnFilter.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    //MARK: - Navigation
    
    override func didTapCartButton() {
        print("Tap cart from CategorylistVC")
    }
    
    override func didTapSearchButton() {
        print("Tap search from CategorylistVC")
    }
    
    
    //MARK: - Other function
    func setData(){
        //1-1
        var aDic = NSMutableDictionary()
        aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal"
        aDic[ApiKey.dealImage] = "room1.jpeg"
        aDic[ApiKey.dealIsFav] = true
        aDic[ApiKey.dealDiscount] = "15"
        aDic[ApiKey.dealRating] = "3.0"
        aDic[ApiKey.dealPrice] = "100"
        aDic[ApiKey.dealClosedPrice] = "90"
        arrDealList.add(aDic)
        
        //1-2
        aDic = NSMutableDictionary()
        aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal1"
        aDic[ApiKey.dealImage] = "room1.jpeg"
        aDic[ApiKey.dealIsFav] = true
        aDic[ApiKey.dealDiscount] = "16"
        aDic[ApiKey.dealRating] = "3.0"
        aDic[ApiKey.dealPrice] = "101"
        aDic[ApiKey.dealClosedPrice] = "91"
        arrDealList.add(aDic)
        
        //1-3
        aDic = NSMutableDictionary()
        aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal2"
        aDic[ApiKey.dealImage] = "room1.jpeg"
        aDic[ApiKey.dealIsFav] = false
        aDic[ApiKey.dealDiscount] = "17"
        aDic[ApiKey.dealRating] = "3.0"
        aDic[ApiKey.dealPrice] = "102"
        aDic[ApiKey.dealClosedPrice] = "92"
        arrDealList.add(aDic)
        
        //1-4
        aDic = NSMutableDictionary()
        aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal3"
        aDic[ApiKey.dealImage] = "room1.jpeg"
        aDic[ApiKey.dealIsFav] = true
        aDic[ApiKey.dealDiscount] = "45"
        aDic[ApiKey.dealRating] = "3.0"
        aDic[ApiKey.dealPrice] = "103"
        aDic[ApiKey.dealClosedPrice] = "94"
        arrDealList.add(aDic)
        
        //1-5
        aDic = NSMutableDictionary()
        aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal4"
        aDic[ApiKey.dealImage] = "room1.jpeg"
        aDic[ApiKey.dealIsFav] = true
        aDic[ApiKey.dealDiscount] = "50"
        aDic[ApiKey.dealRating] = "4.0"
        aDic[ApiKey.dealPrice] = "110"
        aDic[ApiKey.dealClosedPrice] = "96"
        arrDealList.add(aDic)
        
        //1-7
        aDic = NSMutableDictionary()
        aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal5"
        aDic[ApiKey.dealImage] = "room1.jpeg"
        aDic[ApiKey.dealIsFav] = false
        aDic[ApiKey.dealDiscount] = "60"
        aDic[ApiKey.dealRating] = "1.0"
        aDic[ApiKey.dealPrice] = "150"
        aDic[ApiKey.dealClosedPrice] = "98"
        arrDealList.add(aDic)
        
        //1-8
        aDic = NSMutableDictionary()
        aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal6"
        aDic[ApiKey.dealImage] = "room1.jpeg"
        aDic[ApiKey.dealIsFav] = true
        aDic[ApiKey.dealDiscount] = "45"
        aDic[ApiKey.dealRating] = "2.5"
        aDic[ApiKey.dealPrice] = "200"
        aDic[ApiKey.dealClosedPrice] = "92"
        arrDealList.add(aDic)
    }
    
    //MARK: - Actions -
    func btnFavoriteClick(_ sender: UIButton) {
        let dic = self.arrDealList[sender.tag] as! NSMutableDictionary
        if sender.isSelected{
            sender.isSelected = false
            dic[ApiKey.dealIsFav] = false
        }else{
            sender.isSelected = true
            dic[ApiKey.dealIsFav] = true
        }
    }
    
    @IBAction func btnFilterClicked(_ sender: UIButton) {
        let menuVC = storyboard!.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        transition = EasyTransition(attachedViewController: menuVC)
        transition?.transitionDuration = 0.4
        transition?.direction = .right
        //    transition?.blurEffectStyle = .light
        transition?.margins = UIEdgeInsets(top: 64.0, left: 60, bottom: 0, right: 0)
        present(menuVC, animated: true, completion: nil)
    }
    
    @IBAction func btnSortByClicked(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SortByVC") as! SortByVC
        vc.delegate = self
        vc.contentSizeInPopup = CGSize(width: CGFloat(289.0).getProprtionalWidth(), height: 250.0)
        let stVC = STPopupController.init(rootViewController: vc)
        //  stVC.backgroundView?.backgroundColor = UIColor.black
        stVC.style = .bottomSheet
        stVC.navigationBarHidden = true
        stVC.present(in: self)
    }
    
    //MARK: - SortByDelegate
    
    func sortByFinish(){
        print("sort by finish")
    }
    
}

//MARK: - TableView Delegates -

extension CategoryListVC : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListCell", for: indexPath) as! CategoryListCell
        cell.setCategoryListCellData(dicCurrent: self.arrDealList[indexPath.row] as! NSMutableDictionary)
        cell.btnFavorite.tag = indexPath.row
        cell.btnFavorite.addTarget(self, action: #selector(self.btnFavoriteClick(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDealList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 262.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dealDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "DealDetailVC") as! DealDetailVC
        self.pushToViewControllerWithClass(dealDetailVC, andAnimated: true)
    }
}
