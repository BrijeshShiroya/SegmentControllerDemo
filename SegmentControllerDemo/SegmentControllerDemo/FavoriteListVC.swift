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
  
  //MARK: - Life cycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.setTitle(strTitle: "My Favorite")
    tblFavoriteList.register(UINib(nibName: "FavoriteListCell", bundle: nil), forCellReuseIdentifier: "FavoriteListCell")

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


