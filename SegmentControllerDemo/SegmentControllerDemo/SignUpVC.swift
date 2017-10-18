//
//  SignUpVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/17/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

struct SignupKey{
    static var placeholder = "placeholder"
    static var isValid = "isValid"
    static var value = "value"
//    static var firstname = "firstname"
//    static var lastname = "lastname"
//    static var mobile = "mobile"
//    static var email = "email"
//    static var password = "password"
//    static var confirmPassword = "confirmPassword"
//    static var gender = "gender"
//    static var dob = "dob"
//    static var location = "location"
//    static var interestedCategory = "interestedCategory"
}

struct placeHolder{
    static var firstname = "Firstname"
    static var lastname = "Lastname"
    static var mobile = "Mobile Number"
    static var email = "Email Address"
    static var password = "Password"
    static var confirmPassword = "Confirm Password"
    static var gender = "Gender"
    static var dob = "Date of Birth"
    static var location = "Location"
    static var interestedCategory = "Interested Category"
}

class SignUpVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet var tblSignup: UITableView!
    
    @IBOutlet var btnEditProfilePic: UIButton!
    @IBOutlet var imgViewProfile: UIImageView!
    @IBOutlet var btnSignup: UIButton!
    @IBOutlet var footerView: UIView!
    @IBOutlet var headerView: UIView!
    
    //MARK: - Variables
    let arrMainData:NSMutableArray = NSMutableArray()
    //MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblSignup.register(UINib(nibName: "SignupCell", bundle: nil), forCellReuseIdentifier: "SignupCell")
        self.headerView.frame.size = CGSize.init(width: SCREEN_WIDTH, height: CGFloat(120.0).proportionalSizeRelatedToOther(actualSize: 375, toRelatedSize: SCREEN_WIDTH))
        self.footerView.frame.size = CGSize.init(width: SCREEN_WIDTH, height: CGFloat(100.0).proportionalSizeRelatedToOther(actualSize: 375, toRelatedSize: SCREEN_WIDTH))
        self.tblSignup.tableHeaderView = self.headerView
        self.tblSignup.tableFooterView = self.footerView
        setSignupData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Other functions
    func setSignupData(){
        var dicSignup = NSMutableDictionary()
        //firstname
        dicSignup[SignupKey.placeholder] = placeHolder.firstname
        dicSignup[SignupKey.value] = "Brijesh"
        dicSignup[SignupKey.isValid] = true
        arrMainData.add(dicSignup)
        
        //lastname
        dicSignup = NSMutableDictionary()
        dicSignup[SignupKey.placeholder] = placeHolder.lastname
        dicSignup[SignupKey.value] = "Patel"
        dicSignup[SignupKey.isValid] = true
        arrMainData.add(dicSignup)
        
        //mobile
        dicSignup = NSMutableDictionary()
        dicSignup[SignupKey.placeholder] = placeHolder.mobile
        dicSignup[SignupKey.value] = "9558050804"
        dicSignup[SignupKey.isValid] = true
        arrMainData.add(dicSignup)
        
        //password
        dicSignup = NSMutableDictionary()
        dicSignup[SignupKey.placeholder] = placeHolder.password
        dicSignup[SignupKey.value] = "111111"
        dicSignup[SignupKey.isValid] = true
        arrMainData.add(dicSignup)
        
        //cpassword
        dicSignup = NSMutableDictionary()
        dicSignup[SignupKey.placeholder] = placeHolder.confirmPassword
        dicSignup[SignupKey.value] = "111111"
        dicSignup[SignupKey.isValid] = true
        arrMainData.add(dicSignup)
        
        //gender
        dicSignup = NSMutableDictionary()
        dicSignup[SignupKey.placeholder] = placeHolder.gender
        dicSignup[SignupKey.value] = "Male"
        dicSignup[SignupKey.isValid] = true
        arrMainData.add(dicSignup)
        
        //dob
        dicSignup = NSMutableDictionary()
        dicSignup[SignupKey.placeholder] = placeHolder.dob
        dicSignup[SignupKey.value] = "02 Aug 1994"
        dicSignup[SignupKey.isValid] = true
        arrMainData.add(dicSignup)
        
        //location
        dicSignup = NSMutableDictionary()
        dicSignup[SignupKey.placeholder] = placeHolder.location
        dicSignup[SignupKey.value] = "Ahmedabad"
        dicSignup[SignupKey.isValid] = true
        arrMainData.add(dicSignup)
        
        //category
        dicSignup = NSMutableDictionary()
        dicSignup[SignupKey.placeholder] = placeHolder.interestedCategory
        dicSignup[SignupKey.value] = "Food"
        dicSignup[SignupKey.isValid] = true
        arrMainData.add(dicSignup)
        self.tblSignup.reloadData()
    }
    //MARK: - Actions
}

//MARK: - TableView Delegates -

extension SignUpVC : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SignupCell", for: indexPath) as! SignupCell
        cell.setSignupCellData(dictionary: self.arrMainData[indexPath.row] as! NSMutableDictionary)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrMainData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60.0).proportionalSizeRelatedToOther(actualSize: 320, toRelatedSize: SCREEN_WIDTH)
    }
}


