//
//  ReviewListVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/12/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class ReviewListVC: UIViewController {
    //MARK: - Outlets -
    @IBOutlet var tblReviewList: UITableView!
    
    //MARK: - Variables -
    
    //MARK: - Life cycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        tblReviewList.register(UINib(nibName: "ReviewListCell", bundle: nil), forCellReuseIdentifier: "ReviewListCell")
        tblReviewList.estimatedRowHeight = 80.0
        tblReviewList.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setTitle(strTitle: "Review")
        self.navigationController?.isNavigationBarHidden = false
    }
    
    //MARK: - Other functions -
    
    //MARK: - Actions -
}

//MARK: - TableView Delegates -

extension ReviewListVC : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewListCell", for: indexPath) as! ReviewListCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//self.arrTitle.count
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(168.0).getProprtionalHeight()
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}

