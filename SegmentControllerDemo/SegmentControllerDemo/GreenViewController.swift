//
//  GreenViewController.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 9/26/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit
struct ApiKey{
  static let dealTitle = "dealTitle"
  static let dealIsFav = "dealIsFav"
  static let dealRating = "dealRating"
  static let dealImage = "dealImage"
  static let dealPrice = "dealPrice"
  static let dealDiscount = "dealDiscount"
  static let dealType = "dealType"
  static let dealData = "dealData"
  static let dealClosedPrice = "dealClosedPrice"
}

class GreenViewController: UIViewController {

  //MARK: - Outlets -
  
  @IBOutlet var tbl: UITableView!
  
  //MARK: - Variables -
  let arrMain = NSMutableArray()

  //MARK: - Life cycle -

    override func viewDidLoad() {
        super.viewDidLoad()
      tbl.register(UINib(nibName: "DealCell", bundle: nil), forCellReuseIdentifier: "DealCell")
      setData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  //MARK: - Other function -
  
  func setData(){
    //first- deal
    var dicDeal = NSMutableDictionary()
    dicDeal[ApiKey.dealType] = "HOT DEAL"
    var arrDealList = NSMutableArray()
    //1-1
    var aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = true
    aDic[ApiKey.dealDiscount] = "15"
    aDic[ApiKey.dealRating] = "3.0"
    aDic[ApiKey.dealPrice] = "100"
    aDic[ApiKey.dealPrice] = "100"
    arrDealList.add(aDic)
    
    //1-2
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal1"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = true
    aDic[ApiKey.dealDiscount] = "16"
    aDic[ApiKey.dealRating] = "3.0"
    aDic[ApiKey.dealPrice] = "101"
    arrDealList.add(aDic)
    
    //1-3
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal2"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = false
    aDic[ApiKey.dealDiscount] = "17"
    aDic[ApiKey.dealRating] = "3.0"
    aDic[ApiKey.dealPrice] = "102"
    arrDealList.add(aDic)
    
    //1-4
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal3"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = true
    aDic[ApiKey.dealDiscount] = "45"
    aDic[ApiKey.dealRating] = "3.0"
    aDic[ApiKey.dealPrice] = "103"
    arrDealList.add(aDic)
    
    //1-5
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal4"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = true
    aDic[ApiKey.dealDiscount] = "50"
    aDic[ApiKey.dealRating] = "4.0"
    aDic[ApiKey.dealPrice] = "110"
    arrDealList.add(aDic)
    
    //1-7
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal5"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = false
    aDic[ApiKey.dealDiscount] = "60"
    aDic[ApiKey.dealRating] = "1.0"
    aDic[ApiKey.dealPrice] = "150"
    arrDealList.add(aDic)
    
    //1-8
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal6"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = true
    aDic[ApiKey.dealDiscount] = "45"
    aDic[ApiKey.dealRating] = "2.5"
    aDic[ApiKey.dealPrice] = "200"
    arrDealList.add(aDic)
    
    dicDeal[ApiKey.dealData] = arrDealList
    
    arrMain.add(dicDeal)
    
    //second - deal
    
    
    dicDeal = NSMutableDictionary()
    dicDeal[ApiKey.dealType] = "RECOMMENDED DEAL"
    arrDealList = NSMutableArray()
    //1-1
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = true
    aDic[ApiKey.dealDiscount] = "15"
    aDic[ApiKey.dealRating] = "3.0"
    aDic[ApiKey.dealPrice] = "100"
    arrDealList.add(aDic)
    
    //1-2
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal1"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = false
    aDic[ApiKey.dealDiscount] = "16"
    aDic[ApiKey.dealRating] = "3.0"
    aDic[ApiKey.dealPrice] = "101"
    arrDealList.add(aDic)
    
    //1-3
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal2"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = true
    aDic[ApiKey.dealDiscount] = "17"
    aDic[ApiKey.dealRating] = "3.0"
    aDic[ApiKey.dealPrice] = "102"
    arrDealList.add(aDic)
    
    //1-8
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal6"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = false
    aDic[ApiKey.dealDiscount] = "45"
    aDic[ApiKey.dealRating] = "2.5"
    aDic[ApiKey.dealPrice] = "200"
    arrDealList.add(aDic)
    
    dicDeal[ApiKey.dealData] = arrDealList
    
    arrMain.add(dicDeal)
    
    //Third - deal
    
    
    dicDeal = NSMutableDictionary()
    dicDeal[ApiKey.dealType] = "RECENTLY ADDED"
    arrDealList = NSMutableArray()
    //1-1
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = true
    aDic[ApiKey.dealDiscount] = "15"
    aDic[ApiKey.dealRating] = "3.0"
    aDic[ApiKey.dealPrice] = "100"
    arrDealList.add(aDic)
    
    //1-2
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal1"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = false
    aDic[ApiKey.dealDiscount] = "16"
    aDic[ApiKey.dealRating] = "3.0"
    aDic[ApiKey.dealPrice] = "101"
    arrDealList.add(aDic)
    
    //1-3
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal2"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = true
    aDic[ApiKey.dealDiscount] = "17"
    aDic[ApiKey.dealRating] = "3.0"
    aDic[ApiKey.dealPrice] = "102"
    arrDealList.add(aDic)
    
    //1-8
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal6"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = false
    aDic[ApiKey.dealDiscount] = "45"
    aDic[ApiKey.dealRating] = "2.5"
    aDic[ApiKey.dealPrice] = "200"
    arrDealList.add(aDic)
    
    //1-4
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal3"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = true
    aDic[ApiKey.dealDiscount] = "45"
    aDic[ApiKey.dealRating] = "3.0"
    aDic[ApiKey.dealPrice] = "103"
    arrDealList.add(aDic)
    
    //1-5
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal4"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = false
    aDic[ApiKey.dealDiscount] = "50"
    aDic[ApiKey.dealRating] = "4.0"
    aDic[ApiKey.dealPrice] = "110"
    arrDealList.add(aDic)
    
    //1-8
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal6"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = false
    aDic[ApiKey.dealDiscount] = "45"
    aDic[ApiKey.dealRating] = "2.5"
    aDic[ApiKey.dealPrice] = "200"
    arrDealList.add(aDic)
    
    //1-4
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal3"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = true
    aDic[ApiKey.dealDiscount] = "45"
    aDic[ApiKey.dealRating] = "3.0"
    aDic[ApiKey.dealPrice] = "103"
    arrDealList.add(aDic)
    
    //1-5
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal4"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = false
    aDic[ApiKey.dealDiscount] = "50"
    aDic[ApiKey.dealRating] = "4.0"
    aDic[ApiKey.dealPrice] = "110"
    arrDealList.add(aDic)
    
    
    //1-8
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal6"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = false
    aDic[ApiKey.dealDiscount] = "45"
    aDic[ApiKey.dealRating] = "2.5"
    aDic[ApiKey.dealPrice] = "200"
    arrDealList.add(aDic)
    
    //1-4
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal3"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = true
    aDic[ApiKey.dealDiscount] = "45"
    aDic[ApiKey.dealRating] = "3.0"
    aDic[ApiKey.dealPrice] = "103"
    arrDealList.add(aDic)
    
    //1-5
    aDic = NSMutableDictionary()
    aDic[ApiKey.dealTitle] = "Terrece top restaurant Couple Dinner Deal4"
    aDic[ApiKey.dealImage] = "room1.jpeg"
    aDic[ApiKey.dealIsFav] = false
    aDic[ApiKey.dealDiscount] = "50"
    aDic[ApiKey.dealRating] = "4.0"
    aDic[ApiKey.dealPrice] = "110"
    arrDealList.add(aDic)
    
    
    dicDeal[ApiKey.dealData] = arrDealList
    
    arrMain.add(dicDeal)
  }
}

//MARK: - TableView Delegates -
extension GreenViewController : UITableViewDataSource, UITableViewDelegate{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DealCell", for: indexPath) as! DealCell
    cell.setDealcollectionViewCell(dic: arrMain[indexPath.row] as! NSMutableDictionary)
    cell.delegate = self
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.arrMain.count
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 182.0
  }
}

extension GreenViewController: DealCellDelegate{
  func didSelectViewMore(cell: DealCell) {
    guard let indexPath = self.tbl.indexPath(for: cell) else {
      // Note, this shouldn't happen - how did the user tap on a button that wasn't on screen?
      return
    }
    print("selected deal number = \(indexPath.row)")
  }
}
