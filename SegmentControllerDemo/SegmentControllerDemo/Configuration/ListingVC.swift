

//
//  ListingVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/18/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class ListingVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet var tblListing: UITableView!
    
    //MARK: - Variables
    let arrMainData = NSMutableArray()
    //MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tblListing.register(UINib(nibName: "ListingCell", bundle: nil), forCellReuseIdentifier: "ListingCell")
        setListingData()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Other functions
    func setListingData(){
        var dicListing = NSMutableDictionary()
        dicListing["mainTitle"] = "Hey this is listing screen for listn"
        dicListing["subTitle"] = "this is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnthis is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listn"
        dicListing["date"] = "12/11/2017"
        dicListing["imgUrl"] = "https://i.pinimg.com/736x/eb/c8/fb/ebc8fb3971bd50c666a167d524d8f5ba--portrait-photography-men-men-portrait.jpg"
        arrMainData.add(dicListing)
        
        dicListing = NSMutableDictionary()
        dicListing["mainTitle"] = "Hey this is listing screen for listnHey this is listing screen for listn"
        dicListing["subTitle"] = "this is subtitile eieinfnthis is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnthis is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnthis is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listn"
        dicListing["date"] = "12/11/2017"
        dicListing["imgUrl"] = "https://www.learnupon.com/wp-content/uploads/how-customers-love-LU-750x300.jpg"
        arrMainData.add(dicListing)
        
        dicListing = NSMutableDictionary()
        dicListing["mainTitle"] = "Hey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listn"
        dicListing["subTitle"] = "this is subtitile eieinfnthis is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnthis is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnthis is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listn"
        dicListing["date"] = "12/11/2017"
        dicListing["imgUrl"] = "https://i.pinimg.com/736x/eb/c8/fb/ebc8fb3971bd50c666a167d524d8f5ba--portrait-photography-men-men-portrait.jpg"
        arrMainData.add(dicListing)
        
        dicListing = NSMutableDictionary()
        dicListing["mainTitle"] = "Hey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listn"
        dicListing["subTitle"] = "this is subtitile eieinfnthis is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnthis is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnthis is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listn"
        dicListing["date"] = "12/11/2017"
        dicListing["imgUrl"] = "http://www.tabletmag.com/wp-content/files_mf/haiyan620.jpg"
        arrMainData.add(dicListing)
        
        dicListing = NSMutableDictionary()
        dicListing["mainTitle"] = "Hey this is listing screen for listnHey this is listing screen for listn"
        dicListing["subTitle"] = "this is subtitile eieinfnthis is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnthis is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listn"
        dicListing["date"] = "12/11/2017"
        dicListing["imgUrl"] = "https://i.pinimg.com/474x/e2/3e/6f/e23e6f737d3c29b63a051f486fa626e1--todays-news-headlines-today-india.jpg  "
        arrMainData.add(dicListing)
        
        dicListing = NSMutableDictionary()
        dicListing["mainTitle"] = "Hey this is listing s"
        dicListing["subTitle"] = "this is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listn"
        dicListing["date"] = "12/11/2017"
        dicListing["imgUrl"] = "https://i.pinimg.com/736x/dc/47/aa/dc47aa42ff7c517b12283ba74997ff65--latest-financial-news-latest-business-news.jpg"
        arrMainData.add(dicListing)
        
        dicListing = NSMutableDictionary()
        dicListing["mainTitle"] = "Hey this is listing screen for listn"
        dicListing["subTitle"] = "this is subtitile eieinfnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listn"
        dicListing["date"] = "12/11/2017"
        dicListing["imgUrl"] = "http://s3.amazonaws.com/ogden_images/www.timesrepublican.com/images/2017/10/16215152/Kester-candidate-logo-396x500.jpg"
        arrMainData.add(dicListing)
        
        dicListing = NSMutableDictionary()
        dicListing["mainTitle"] = "Hey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listnHey this is listing screen for listn"
        dicListing["subTitle"] = "this is subtitile eieinfnHey this is listing screen for listn"
        dicListing["date"] = "12/11/2017"
        dicListing["imgUrl"] = "http://eslgold.com/esl/img169.jpg"
        
        arrMainData.add(dicListing)
        self.tblListing.reloadData()
        
    }
    
    //MARK: - Actions
}

//MARK: - TableView Delegates -

extension ListingVC : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListingCell", for: indexPath) as! ListingCell
        cell.setListingCellData(dictionary: self.arrMainData[indexPath.row] as! NSMutableDictionary)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrMainData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}





