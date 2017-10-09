//
//  DealCell.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 9/29/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit


protocol DealCellDelegate {
  func didSelectViewMore(cell:DealCell)
}
class DealCell: UITableViewCell {
  
  //MARK: - Outlets -
  var delegate:DealCellDelegate?
  @IBOutlet var dealCollectionView: UICollectionView!
  @IBOutlet var lblDealTitle: AwfirLabel!
  
  //MARK: - variables -
  var arrDealList:NSMutableArray?
  var dicCurrentDeal:NSMutableDictionary?
  
  //MARK: - Life cycle -
  override func awakeFromNib() {
    super.awakeFromNib()
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize.init(width: 145.0, height: 145.5)
    layout.minimumInteritemSpacing = 5.0
    self.dealCollectionView.collectionViewLayout = layout
    
    self.dealCollectionView.register(UINib.init(nibName: "dealCollectionCell", bundle: nil), forCellWithReuseIdentifier: "dealCollectionCell")
    self.dealCollectionView.register(UINib.init(nibName: "ViewMoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ViewMoreCollectionViewCell")
    self.dealCollectionView.delegate = self
    self.dealCollectionView.dataSource = self
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  //MARK: - Other function -
  
  func setDealcollectionViewCell(dic: NSMutableDictionary)
  {
    self.dicCurrentDeal = dic
    self.lblDealTitle.text = dic[ApiKey.dealType] as? String
    self.arrDealList = dic[ApiKey.dealData] as? NSMutableArray
    self.dealCollectionView.reloadData()
  }
  
  //MARK: - Actions -
  func btnLikeClick(_ sender: UIButton) {
    let dic = self.arrDealList?[sender.tag] as! NSMutableDictionary
    if sender.isSelected{
      sender.isSelected = false
      dic[ApiKey.dealIsFav] = false
    }else{
      sender.isSelected = true
      dic[ApiKey.dealIsFav] = true
    }
  }
  //MARK: - DealCellDelegate -
  
  func btnMoreViewClick(_ sender: UIButton) {
    print("more presssed")
    delegate?.didSelectViewMore(cell: self)
  }
}


//MARK: - CollectionView Delegates -
extension DealCell: UICollectionViewDelegate,UICollectionViewDataSource{
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if (arrDealList?.count)! <= 6{
      return (arrDealList?.count)!
    }else{
      return 7
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if indexPath.row <= 5{
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dealCollectionCell", for: indexPath) as! dealCollectionCell
      cell.setDealData(dicCurrent: arrDealList?[indexPath.row] as! NSMutableDictionary)
      cell.btnFav.tag = indexPath.row
      cell.btnFav.addTarget(self, action: #selector(self.btnLikeClick(_:)), for: .touchUpInside)
      return cell
    }else{
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ViewMoreCollectionViewCell", for: indexPath) as! ViewMoreCollectionViewCell
      cell.btnMore.tag = indexPath.row
      cell.btnMore.addTarget(self, action: #selector(self.btnMoreViewClick(_:)), for: .touchUpInside)
      return cell
    }
  }
}

