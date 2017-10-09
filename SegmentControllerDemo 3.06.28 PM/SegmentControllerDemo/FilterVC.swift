//
//  FilterVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/6/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

struct FilterKey{
  static let FilterTitle = "mainCategoryName"
  static let FilterSubCategoryName = "subCategoryName"
  static let FilterSubCategoryItems = "subCategoryItems"
  static let isSelected = "isSelected"
}

class FilterVC: UIViewController {
  //TODO: - Outlets -
  @IBOutlet var tblSubCategory: UITableView!
  @IBOutlet var tblMainCategory: UITableView!
  
  //TODO: - Variables -
  var arrMainData = NSMutableArray()
  var selectedSection:Int = 0// store selected filter type
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tblSubCategory.register(UINib(nibName: "FilterMainCategoryCell", bundle: nil), forCellReuseIdentifier: "FilterMainCategoryCell")
    tblMainCategory.register(UINib(nibName: "FilterMainCategoryCell", bundle: nil), forCellReuseIdentifier: "FilterMainCategoryCell")
    
    tblSubCategory.register(UINib(nibName: "FilterSubCategoryCell", bundle: nil), forCellReuseIdentifier: "FilterSubCategoryCell")
    tblMainCategory.register(UINib(nibName: "FilterSubCategoryCell", bundle: nil), forCellReuseIdentifier: "FilterSubCategoryCell")
    
    self.setFilterData()
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //MARK: - Other functions
  func setFilterData(){
    arrMainData = NSMutableArray()
    //1
    var dic = NSMutableDictionary()
    dic[FilterKey.FilterTitle] = "Discount"
    
    var arrSubCategory = NSMutableArray()
    var dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "10"
    dicSubCategory[FilterKey.FilterTitle] = "Discount"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "20"
    dicSubCategory[FilterKey.FilterTitle] = "Discount"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "30"
    dicSubCategory[FilterKey.FilterTitle] = "Discount"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "40"
    dicSubCategory[FilterKey.FilterTitle] = "Discount"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "50"
    dicSubCategory[FilterKey.FilterTitle] = "Discount"
    arrSubCategory.add(dicSubCategory)
    
    dic[FilterKey.FilterSubCategoryItems] = arrSubCategory
    arrMainData.add(dic)
    
    //2
    dic = NSMutableDictionary()
    dic[FilterKey.FilterTitle] = "Brand"
    
    arrSubCategory = NSMutableArray()
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "Samsung"
    dicSubCategory[FilterKey.FilterTitle] = "Brand"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "Motorola"
    dicSubCategory[FilterKey.FilterTitle] = "Brand"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "Nokia"
    dicSubCategory[FilterKey.FilterTitle] = "Brand"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "LG"
    dicSubCategory[FilterKey.FilterTitle] = "Brand"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "One plus"
    dicSubCategory[FilterKey.FilterTitle] = "Brand"
    arrSubCategory.add(dicSubCategory)
    
    dic[FilterKey.FilterSubCategoryItems] = arrSubCategory
    arrMainData.add(dic)
    
    //3
    dic = NSMutableDictionary()
    dic[FilterKey.FilterTitle] = "Price"
    
    arrSubCategory = NSMutableArray()
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "1000-2000"
    dicSubCategory[FilterKey.FilterTitle] = "Price"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "2000-3000"
    dicSubCategory[FilterKey.FilterTitle] = "Price"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "3000-5000"
    dicSubCategory[FilterKey.FilterTitle] = "Price"
    arrSubCategory.add(dicSubCategory)
    
    dic[FilterKey.FilterSubCategoryItems] = arrSubCategory
    arrMainData.add(dic)
    
    
    //4
    dic = NSMutableDictionary()
    dic[FilterKey.FilterTitle] = "Location"
    
    arrSubCategory = NSMutableArray()
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "Ahmedabad"
    dicSubCategory[FilterKey.FilterTitle] = "Location"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "Baroda"
    dicSubCategory[FilterKey.FilterTitle] = "Location"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "Ratanpur"
    dicSubCategory[FilterKey.FilterTitle] = "Location"
    arrSubCategory.add(dicSubCategory)
    
    dic[FilterKey.FilterSubCategoryItems] = arrSubCategory
    arrMainData.add(dic)
    
    
    
    //5
    dic = NSMutableDictionary()
    dic[FilterKey.FilterTitle] = "Rating"
    
    arrSubCategory = NSMutableArray()
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "1 star"
    dicSubCategory[FilterKey.FilterTitle] = "Rating"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "2 star"
    dicSubCategory[FilterKey.FilterTitle] = "Rating"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "3 star"
    dicSubCategory[FilterKey.FilterTitle] = "Rating"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "4 star"
    dicSubCategory[FilterKey.FilterTitle] = "Rating"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "5 star"
    dicSubCategory[FilterKey.FilterTitle] = "Rating"
    arrSubCategory.add(dicSubCategory)
    
    dic[FilterKey.FilterSubCategoryItems] = arrSubCategory
    arrMainData.add(dic)
    
    
    //6
    dic = NSMutableDictionary()
    dic[FilterKey.FilterTitle] = "Validity"
    
    arrSubCategory = NSMutableArray()
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "1 month"
    dicSubCategory[FilterKey.FilterTitle] = "Validity"
    arrSubCategory.add(dicSubCategory)
    
    dicSubCategory = NSMutableDictionary()
    dicSubCategory[FilterKey.isSelected] = false
    dicSubCategory[FilterKey.FilterSubCategoryName] = "25 days"
    dicSubCategory[FilterKey.FilterTitle] = "Validity"
    arrSubCategory.add(dicSubCategory)
    
    dic[FilterKey.FilterSubCategoryItems] = arrSubCategory
    arrMainData.add(dic)
    self.selectedSection = 0
    self.tblMainCategory.reloadData()
    self.tblSubCategory.reloadData()

  }
  //TODO: - Actions -
  @IBAction func btnCloseClicked(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
  
  func subCategoryClick(sender:UIButton){
    //change value in main array based on button state
    if sender.isSelected{
        sender.isSelected = false
        (((self.arrMainData[self.selectedSection] as! NSMutableDictionary)[FilterKey.FilterSubCategoryItems] as! NSMutableArray)[sender.tag] as! NSMutableDictionary)[FilterKey.isSelected] = false
    }else{
        sender.isSelected = true
       (((self.arrMainData[self.selectedSection] as! NSMutableDictionary)[FilterKey.FilterSubCategoryItems] as! NSMutableArray)[sender.tag] as! NSMutableDictionary)[FilterKey.isSelected] = true
    }
    
  }
  
  @IBAction func btnResetClicked(_ sender: UIButton) {
    //set false in dictionary value isSelected
    self.arrMainData.setValue(false, forKeyPath: "subCategoryItems.isSelected")
    self.tblSubCategory.reloadData()
  }
  
  @IBAction func btnApplyClicked(_ sender: UIButton) {
    let arrSelectedFilterData = NSMutableArray()
    //get dictionary which is selected and store into 
    for dic in self.arrMainData{
      let a = ((dic as! NSMutableDictionary)["subCategoryItems"] as! NSArray).filtered(using: NSPredicate.init(format: "isSelected = %@", true as CVarArg)) as NSArray
      if a.count != 0{
        arrSelectedFilterData.addObjects(from: a as! [Any])
      }
    }
    print(arrSelectedFilterData)
    
  }
}

//TODO: - TableView Delegates -

extension FilterVC : UITableViewDataSource, UITableViewDelegate{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if self.arrMainData.count != 0{
      if tableView == self.tblMainCategory{
        return self.arrMainData.count
      }else{
        return ((self.arrMainData[selectedSection] as! NSMutableDictionary)[FilterKey.FilterSubCategoryItems] as! NSMutableArray).count//self.arrTitle.count
      }
    }else{
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if tableView == self.tblMainCategory{
      let cell = tableView.dequeueReusableCell(withIdentifier: "FilterMainCategoryCell", for: indexPath) as! FilterMainCategoryCell
      cell.lblFilterName.text = (self.arrMainData[indexPath.row] as! NSMutableDictionary)[FilterKey.FilterTitle] as? String
      return cell
    }else{
      let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSubCategoryCell", for: indexPath) as! FilterSubCategoryCell
      cell.setFilterSubCategoryCell(dictionary: ((self.arrMainData[self.selectedSection] as! NSMutableDictionary)[FilterKey.FilterSubCategoryItems] as! NSMutableArray)[indexPath.row] as! NSMutableDictionary)
      cell.btnSubCategory.tag = indexPath.row
      cell.btnSubCategory.addTarget(self, action: #selector(self.subCategoryClick(sender:)), for: .touchUpInside)
      return cell
    }
  }
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44.0
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == self.tblMainCategory{
      self.selectedSection = indexPath.row
      self.tblSubCategory.reloadData()
    }
  }
}


