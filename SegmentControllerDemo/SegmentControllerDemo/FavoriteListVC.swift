//
//  FavoriteListVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/4/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class FavoriteListVC: UIViewController {
    //MARK: - Outlets -
    @IBOutlet var tblFavoriteList: UITableView!
    
    //MARK: - Variables -
    var refreshControl: UIRefreshControl!
    //MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setTitle(strTitle: "My Favorite")
        tblFavoriteList.register(UINib(nibName: "FavoriteListCell", bundle: nil), forCellReuseIdentifier: "FavoriteListCell")
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        tblFavoriteList.addSubview(refreshControl)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    //MARK: - Actions -
    func refresh(){
        self.tblFavoriteList.reloadData()
        refreshControl.endRefreshing()
    }
    
    //MARK: - Other functions -
    
}
//MARK: - TableView Delegates -

extension FavoriteListVC : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteListCell", for: indexPath) as! FavoriteListCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172.5
    }
}


