//
//  SettingVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/5/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {
  //MARK: - Outlets -
  
  @IBOutlet var tblSetting: UITableView!
  let arrTitle = ["My Profile","Credit Cards","Help","Sign Out"]
  //MARK: - Variables -
  
  //MARK: - Life cycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    tblSetting.register(UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: "SettingCell")
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.setTitle(strTitle: "Settings")
    self.navigationController?.isNavigationBarHidden = false
  }
  //MARK: - Other functions -
  
  //MARK: - Actions -
  
}

//MARK: - TableView Delegates -

extension SettingVC : UITableViewDataSource, UITableViewDelegate{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingCell
    cell.lblTitle.text = self.arrTitle[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.arrTitle.count
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return CGFloat(44).getProprtionalHeight()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    switch(indexPath.row){
    case 0:
      let nextVC = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
      self.pushToViewControllerWithClass(nextVC, andAnimated: true)
    case 1:
      let nextVC = storyboard?.instantiateViewController(withIdentifier: "RedViewController") as! RedViewController
      self.pushToViewControllerWithClass(nextVC, andAnimated: true)
    case 2:
      let nextVC = storyboard?.instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
      self.pushToViewControllerWithClass(nextVC, andAnimated: true)
    case 3:
      let nextVC = storyboard?.instantiateViewController(withIdentifier: "CartVC") as! CartVC
      self.pushToViewControllerWithClass(nextVC, andAnimated: true)
    default:
      return
    }
  }
}
