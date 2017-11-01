//
//  CartVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/10/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class CartVC: UIViewController {
    //MARK: - Outlets -
    
    @IBOutlet var tblCartData: UITableView!
    //MARK: - Variables -
    
    //MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        tblCartData.register(UINib(nibName: "CartCell", bundle: nil), forCellReuseIdentifier: "CartCell")
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Other functions -
    
    //MARK: - Actions -
    
}

//MARK: - TableView Delegates -

extension CartVC : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//self.arrTitle.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(107.0).getProprtionalHeight()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CartCell
        cell.ViewExtra.isHidden = false
        cell.ViewExtra.backgroundColor = UIColor.blue
        cell.viewMain.backgroundColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            (cell as! CartCell).ViewExtra.isHidden = true
        }
    }
}

