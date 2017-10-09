//
//  MyProfileVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/5/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

//customcell == Expandedecell
//custom1 == collapsedcell

import UIKit



struct MyProfileKey{
  static let fieldImage = "fieldImage"
  static let fieldTitle = "fieldTitle"
  static let fieldValue = "fieldValue"
  static let textFieldValue = "textFieldValue"
  static let textFieldPlaceholder = "textFieldPlaceholder"
}

class MyProfileVC: UIViewController {
  
  //MARK:- Outlets -
  @IBOutlet var tblMyProfile: UITableView!
  //MARK:- Variables -
  let count = 20
  let arrMainData = NSMutableArray()
  let arrSelectedSectionIndex = NSMutableArray()
  var isMultipleExpansionAllowed:Bool = true
  
  //MARK:- Life cycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    tblMyProfile.register(UINib(nibName: "MyProfileCollapsedCell", bundle: nil), forCellReuseIdentifier: "MyProfileCollapsedCell")
    tblMyProfile.register(UINib(nibName: "MyProfileExpandedCell", bundle: nil), forCellReuseIdentifier: "MyProfileExpandedCell")
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
    self.navigationController?.setTitle(strTitle: "My Profile")
    self.navigationController?.isNavigationBarHidden = false
  }
  //MARK:- Other functions -
  
  func setTableData() {
    var dicTableData = NSMutableDictionary()
    dicTableData["name"] = "Mac"
    dicTableData["collapsed"] = true
    var arr = NSMutableArray()
    var dicTemp = NSMutableDictionary()
    dicTemp["name"] = "MacBook"
    dicTemp["detail"] = "Apple's ultraportable laptop, trading portability for speed and connectivity."
    arr.add(dicTemp)
    
    dicTemp = NSMutableDictionary()
    dicTemp["name"] = "MacBook Air"
    dicTemp["detail"] = "While the screen could be sharper, the updated 11-inch MacBook Air is a very light ultraportable that offers great performance and battery life for the price."
    arr.add(dicTemp)
    
    dicTemp = NSMutableDictionary()
    dicTemp["name"] = "MacBook Pro"
    dicTemp["detail"] = "Retina Display The brightest, most colorful Mac notebook display ever. The display in the MacBook Pro is the best ever in a Mac notebook."
    arr.add(dicTemp)
    
    dicTemp = NSMutableDictionary()
    dicTemp["name"] = "iMac"
    dicTemp["detail"] = "iMac combines enhanced performance with our best ever Retina display for the ultimate desktop experience in two sizes."
    arr.add(dicTemp)
    
    dicTemp = NSMutableDictionary()
    dicTemp["name"] = "Mac Pro"
    dicTemp["detail"] = "Mac Pro is equipped with pro-level graphics, storage, expansion, processing power, and memory. It's built for creativity on an epic scale."
    arr.add(dicTemp)
    
    dicTemp = NSMutableDictionary()
    dicTemp["name"] = "OS X El Capitan"
    dicTemp["detail"] = "The twelfth major release of OS X (now named macOS)."
    arr.add(dicTemp)
    
    dicTemp = NSMutableDictionary()
    dicTemp["name"] = "Mac mini"
    dicTemp["detail"] = "Mac mini is an affordable powerhouse that packs the entire Mac experience into a 7.7-inch-square frame."
    arr.add(dicTemp)
    dicTableData["items"] = arr
    self.arrMainData.add(dicTableData)
    
    //second section
    dicTableData = NSMutableDictionary()
    dicTableData["name"] = "iPad"
    dicTableData["collapsed"] = true
    
    arr = NSMutableArray()
    dicTemp = NSMutableDictionary()
    dicTemp["name"] = "iPad Pro"
    dicTemp["detail"] = "iPad Pro delivers epic power, in 12.9-inch and a new 10.5-inch size."
    arr.add(dicTemp)
    
    dicTemp = NSMutableDictionary()
    dicTemp["name"] = "iPad Air 2"
    dicTemp["detail"] = "The second-generation iPad Air tablet computer designed, developed, and marketed by Apple Inc."
    arr.add(dicTemp)
    
    dicTemp = NSMutableDictionary()
    dicTemp["name"] = "iPad mini 4"
    dicTemp["detail"] = "iPad mini 4 puts uncompromising performance and potential in your hand."
    arr.add(dicTemp)
    
    dicTemp = NSMutableDictionary()
    dicTemp["name"] = "iMac"
    dicTemp["detail"] = "iMac combines enhanced performance with our best ever Retina display for the ultimate desktop experience in two sizes."
    arr.add(dicTemp)
    
    dicTableData["items"] = arr
    self.arrMainData.add(dicTableData)
    
    
    //Third section
    dicTableData = NSMutableDictionary()
    dicTableData["name"] = "iPhone"
    dicTableData["collapsed"] = true
    arr = NSMutableArray()
    dicTemp = NSMutableDictionary()
    dicTemp["name"] = "iPhone 6s"
    dicTemp["detail"] = "The iPhone 6S has a similar design to the 6 but updated hardware, including a strengthened chassis and upgraded system-on-chip, a 12-megapixel camera, improved fingerprint recognition sensor, and LTE Advanced support."
    arr.add(dicTemp)
    
    dicTemp = NSMutableDictionary()
    dicTemp["name"] = "iPhone 6"
    dicTemp["detail"] = "The iPhone 6 and iPhone 6 Plus are smartphones designed and marketed by Apple Inc."
    arr.add(dicTemp)
    
    dicTemp = NSMutableDictionary()
    dicTemp["name"] = "iPhone SE"
    dicTemp["detail"] = "The iPhone SE was received positively by critics, who noted its familiar form factor and design, improved hardware over previous 4-inch iPhone models, as well as its overall performance and battery life."
    arr.add(dicTemp)
    
    dicTableData["items"] = arr
    self.arrMainData.add(dicTableData)
  }
  //MARK:- Actions -
  
}

//MARK: - TableView Delegates -

extension MyProfileVC : UITableViewDataSource, UITableViewDelegate{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 10//self.arrMainData.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if arrSelectedSectionIndex.contains(NSNumber.init(value: section)){
      return 1//((self.arrMainData[section] as! NSMutableDictionary)["items"] as! NSMutableArray).count
    }else{
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MyProfileExpandedCell") as! MyProfileExpandedCell
  //  let dicCurrent = ((self.arrMainData[indexPath.section] as! NSMutableDictionary)["items"] as! NSMutableArray)[indexPath.row] as! NSMutableDictionary
   // cell.lblTitle.text = dicCurrent["name"] as? String
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat(44.0).getProprtionalHeight()
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MyProfileCollapsedCell") as! MyProfileCollapsedCell
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
    return CGFloat(44.0).getProprtionalHeight()
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
      UIView.transition(with: self.tblMyProfile, duration: 1.0, options: .curveLinear, animations: {self.tblMyProfile.reloadData()}, completion: nil)
    }else{
      tblMyProfile.reloadSections(NSIndexSet.init(index: sender.tag) as IndexSet, with: .automatic)
    }
    
  }
}


