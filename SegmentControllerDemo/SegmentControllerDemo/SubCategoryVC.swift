//
//  SubCategoryVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/6/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit


struct SubCategoryKey{
  static let mainCategoryName = "mainCategoryName"
  static let subCategoryName = "subCategoryName"
  static let subCategoryItems = "subCategoryItems"
}
class SubCategoryVC: UIViewController {
  //MARK: - Outlets -
  @IBOutlet var tblSubCategory: UITableView!
  
  //MARK: - Variables -
  let count = 20
  var arrMainData = NSMutableArray()
  let arrSelectedSectionIndex = NSMutableArray()
  var isMultipleExpansionAllowed:Bool = true
  
  //MARK: - Life cycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    tblSubCategory.register(UINib(nibName: "SubCategoryCollapsedCell", bundle: nil), forCellReuseIdentifier: "SubCategoryCollapsedCell")
    tblSubCategory.register(UINib(nibName: "SubCategoryExpandedCell", bundle: nil), forCellReuseIdentifier: "SubCategoryExpandedCell")
    setSubCategoryData()
    if !isMultipleExpansionAllowed{
      arrSelectedSectionIndex.add(NSNumber.init(value: count+2))
    }
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.setTitle(strTitle: "Goods")
    self.navigationController?.isNavigationBarHidden = false
  }
  
  //MARK: - Other functions -
  
  func setSubCategoryData(){
    arrMainData = NSMutableArray()
    //1
    var dic = NSMutableDictionary()
    dic[SubCategoryKey.mainCategoryName] = "Electronics"
    
    var arrSubCategory = NSMutableArray()
    arrSubCategory.add("Mobiles & Tablets")
    arrSubCategory.add("Tv & Sound Systems")
    arrSubCategory.add("Kitchen Appliances")
    arrSubCategory.add("Laptops & Computer Periferals")
    arrSubCategory.add("Softwares")
    
    dic[SubCategoryKey.subCategoryItems] = arrSubCategory
    arrMainData.add(dic)
    
    //2
    dic = NSMutableDictionary()
    dic[SubCategoryKey.mainCategoryName] = "Fashion"
    
    arrSubCategory = NSMutableArray()
    arrSubCategory.add("Pents")
    arrSubCategory.add("Shirts")
    arrSubCategory.add("Footwears")
    arrSubCategory.add("Accessories")
    
    dic[SubCategoryKey.subCategoryItems] = arrSubCategory
    arrMainData.add(dic)
    //3
    dic = NSMutableDictionary()
    dic[SubCategoryKey.mainCategoryName] = "Sports"
    
    arrSubCategory = NSMutableArray()
    arrSubCategory.add("Sports shoes")
    arrSubCategory.add("Sports equipments")
    arrSubCategory.add("Sports wear")
    
    dic[SubCategoryKey.subCategoryItems] = arrSubCategory
    arrMainData.add(dic)
    
    //4
    dic = NSMutableDictionary()
    dic[SubCategoryKey.mainCategoryName] = "Groceries"
    
    arrSubCategory = NSMutableArray()
    arrSubCategory.add("Groceries-1")
    arrSubCategory.add("Groceries-2")
    arrSubCategory.add("Groceries-3")
    
    dic[SubCategoryKey.subCategoryItems] = arrSubCategory
    arrMainData.add(dic)
    
    //5
    dic = NSMutableDictionary()
    dic[SubCategoryKey.mainCategoryName] = "Health & Beauty"
    
    arrSubCategory = NSMutableArray()
    arrSubCategory.add("Spa")
    arrSubCategory.add("saloon")
    
    dic[SubCategoryKey.subCategoryItems] = arrSubCategory
    arrMainData.add(dic)
  }
  
  //MARK: - Actions -
}

//MARK: - TableView Delegates -

extension SubCategoryVC : UITableViewDataSource, UITableViewDelegate{
  func numberOfSections(in tableView: UITableView) -> Int {
    return self.arrMainData.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if arrSelectedSectionIndex.contains(NSNumber.init(value: section)){
      return ((self.arrMainData[section] as! NSMutableDictionary)[SubCategoryKey.subCategoryItems] as! NSMutableArray).count
    }else{
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryExpandedCell") as! SubCategoryExpandedCell
    cell.titleExpanded.text = ((self.arrMainData[indexPath.section] as! NSMutableDictionary)[SubCategoryKey.subCategoryItems] as! NSMutableArray)[indexPath.row] as! String
    //  let dicCurrent = ((self.arrMainData[indexPath.section] as! NSMutableDictionary)["items"] as! NSMutableArray)[indexPath.row] as! NSMutableDictionary
    // cell.lblTitle.text = dicCurrent["name"] as? String
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat(44.0).getProprtionalHeight()
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryCollapsedCell") as! SubCategoryCollapsedCell
    cell.lblTitle.text = (self.arrMainData[section] as! NSMutableDictionary)[SubCategoryKey.mainCategoryName] as? String
    //cell.lblTitle.text = (self.arrMainData[section] as! NSMutableDictionary)["name"] as? String
    
    if arrSelectedSectionIndex.contains(NSNumber.init(value: section))
    {
      cell.btnExpand.isSelected = true
    }
    cell.btnExpand.tag = section
    cell.btnExpand.addTarget(self, action: #selector(self.btnTapShowHideSection(_:)), for: .touchUpInside)
    return cell.contentView
  }
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return CGFloat(30.0).getProprtionalHeight()
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
      UIView.transition(with: self.tblSubCategory, duration: 1.0, options: .curveLinear, animations: {self.tblSubCategory.reloadData()}, completion: nil)
    }else{
      tblSubCategory.reloadSections(NSIndexSet.init(index: sender.tag) as IndexSet, with: .automatic)
    }
    
  }
}



