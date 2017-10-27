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

enum textFieldType:Int {
    case none = 0
    case expandable = 1
    case switched = 2
}

struct MyProfileKey{
    static let firstname = "FirstName"
    static let lastname = "LastName"
    static let email = "Email Address"
    static let mobile = "Mobile Number"
    static let gender = "Gender"
    static let dob = "DOB"
    static let location = "Location"
    static let interests = "Interests"
    static let changePassword = "Change Password"
    static let pushNotification = "Push Notifications"
    static let emailNotification = "Email Notifications"
    static let newsLetters = "Newsletters"
    static let value = "value"
    static let type = "type"
    static let fieldName = "fieldName"
    static let fieldImage = "fieldImage"
    
}

class MyProfileVC: UIViewController {
    
    //MARK:- Outlets -
    @IBOutlet var tblMyProfile: UITableView!
    @IBOutlet var headerView: UIView!
    
    //MARK:- Variables -
    let count = 20
    let arrMainData = NSMutableArray()
    let arrSelectedSectionIndex = NSMutableArray()
    var isMultipleExpansionAllowed:Bool = true
    
    //MARK:- Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMyProfile.register(UINib(nibName: "MyProfileCollapsedCell", bundle: nil), forCellReuseIdentifier: "MyProfileCollapsedCell")
        tblMyProfile.register(UINib(nibName: "MyProfileSwitchCell", bundle: nil), forCellReuseIdentifier: "MyProfileSwitchCell")
        tblMyProfile.register(UINib(nibName: "MyProfileExpandedCell", bundle: nil), forCellReuseIdentifier: "MyProfileExpandedCell")
        self.headerView.frame.size = CGSize.init(width: SCREEN_WIDTH, height: CGFloat(190.0).proportionalSizeRelatedToOther(actualSize: 375.0, toRelatedSize: SCREEN_WIDTH))
        setTableData()
        self.tblMyProfile.tableHeaderView = self.headerView
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
        //firstname
        var dic = NSMutableDictionary()
        dic[MyProfileKey.fieldName] = MyProfileKey.firstname
        dic[MyProfileKey.value] = "Brijesh"
        dic[MyProfileKey.type] = textFieldType.none
        dic[MyProfileKey.fieldImage] = "a"
        arrMainData.add(dic)
        
        //lastname
        dic = NSMutableDictionary()
        dic[MyProfileKey.fieldName] = MyProfileKey.lastname
        dic[MyProfileKey.value] = "Patel"
        dic[MyProfileKey.type] = textFieldType.none
        dic[MyProfileKey.fieldImage] = "a"
        arrMainData.add(dic)
        
        //email
        dic = NSMutableDictionary()
        dic[MyProfileKey.fieldName] = MyProfileKey.email
        dic[MyProfileKey.value] = "brijesh@gmail.com"
        dic[MyProfileKey.type] = textFieldType.none
        dic[MyProfileKey.fieldImage] = "a"
        arrMainData.add(dic)
        
        //mobile
        dic = NSMutableDictionary()
        dic[MyProfileKey.fieldName] = MyProfileKey.mobile
        dic[MyProfileKey.value] = "9558050807"
        dic[MyProfileKey.type] = textFieldType.none
        dic[MyProfileKey.fieldImage] = "a"
        arrMainData.add(dic)
        
        //gender
        dic = NSMutableDictionary()
        dic[MyProfileKey.fieldName] = MyProfileKey.gender
        dic[MyProfileKey.value] = "Male"
        dic[MyProfileKey.type] = textFieldType.none
        dic[MyProfileKey.fieldImage] = "a"
        arrMainData.add(dic)
        
        //dob
        dic = NSMutableDictionary()
        dic[MyProfileKey.fieldName] = MyProfileKey.dob
        dic[MyProfileKey.value] = "02/08/1994"
        dic[MyProfileKey.type] = textFieldType.none
        dic[MyProfileKey.fieldImage] = "a"
        arrMainData.add(dic)
        
        //location
        dic = NSMutableDictionary()
        dic[MyProfileKey.fieldName] = MyProfileKey.location
        dic[MyProfileKey.value] = "Ahmedabad"
        dic[MyProfileKey.type] = textFieldType.none
        dic[MyProfileKey.fieldImage] = "a"
        arrMainData.add(dic)
        
        //interest
        dic = NSMutableDictionary()
        dic[MyProfileKey.fieldName] = MyProfileKey.interests
        dic[MyProfileKey.value] = ""
        dic[MyProfileKey.type] = textFieldType.expandable
        dic[MyProfileKey.fieldImage] = "a"
        arrMainData.add(dic)
        
        //change password
        dic = NSMutableDictionary()
        dic[MyProfileKey.fieldName] = MyProfileKey.changePassword
        dic[MyProfileKey.value] = ""
        dic[MyProfileKey.type] = textFieldType.expandable
        dic[MyProfileKey.fieldImage] = "a"
        arrMainData.add(dic)
        
        //Push notification
        dic = NSMutableDictionary()
        dic[MyProfileKey.fieldName] = MyProfileKey.pushNotification
        dic[MyProfileKey.value] = ""
        dic[MyProfileKey.type] = textFieldType.switched
        dic[MyProfileKey.fieldImage] = "a"
        arrMainData.add(dic)
        
        //Email notification
        dic = NSMutableDictionary()
        dic[MyProfileKey.fieldName] = MyProfileKey.emailNotification
        dic[MyProfileKey.value] = ""
        dic[MyProfileKey.type] = textFieldType.switched
        dic[MyProfileKey.fieldImage] = "a"
        arrMainData.add(dic)
        
        //Newsletter
        dic = NSMutableDictionary()
        dic[MyProfileKey.fieldName] = MyProfileKey.newsLetters
        dic[MyProfileKey.value] = ""
        dic[MyProfileKey.type] = textFieldType.switched
        dic[MyProfileKey.fieldImage] = "a"
        arrMainData.add(dic)
        
        
    }
    //MARK:- Actions -
    
}

//MARK: - TableView Delegates -

extension MyProfileVC : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrMainData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dicCurrent = self.arrMainData[section] as! NSMutableDictionary
        if dicCurrent[MyProfileKey.type] as! textFieldType == textFieldType.expandable{
            if arrSelectedSectionIndex.contains(NSNumber.init(value: section)){
                return 1
            }else{
                return 0
            }
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyProfileExpandedCell") as! MyProfileExpandedCell
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(44.0).getProprtionalHeight()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let dicCurrent = self.arrMainData[section] as! NSMutableDictionary
        if dicCurrent[MyProfileKey.type] as! textFieldType == textFieldType.switched{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyProfileSwitchCell") as! MyProfileSwitchCell
            cell.setMyProfileSwitchCell(dictionary: dicCurrent)
            return cell.contentView
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyProfileCollapsedCell") as! MyProfileCollapsedCell
            
            if dicCurrent[MyProfileKey.type] as! textFieldType == textFieldType.expandable{
                cell.btnExpand.isHidden = false
            }
            cell.setMyProfileCollapsedCell(dictionary: dicCurrent)
            //cell.lblTitle.text = (self.arrMainData[section] as! NSMutableDictionary)["name"] as? String
            
            if arrSelectedSectionIndex.contains(NSNumber.init(value: section))
            {
                cell.btnExpand.isSelected = true
            }
            cell.btnExpand.tag = section
            cell.btnExpand.addTarget(self, action: #selector(self.btnTapShowHideSection(_:)), for: .touchUpInside)
            return cell.contentView
        }
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


