//
//  NotificationListVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/12/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class NotificationListVC: UIViewController {
    //MARK: - Outlets -
     @IBOutlet var tblNotificationListData: UITableView!
    
    //MARK: - Variables -

    
    //MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        tblNotificationListData.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "NotificationCell")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setTitle(strTitle: "Notification")
        self.navigationController?.isNavigationBarHidden = false
    }
}

//MARK: - TableView Delegates -

extension NotificationListVC : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//self.arrTitle.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(44.0).getProprtionalHeight()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    
    }
}

