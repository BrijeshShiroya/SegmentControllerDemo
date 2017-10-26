//
//  ViewMoreVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/3/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

protocol ViewMoreDelegate {
    func viewMoreFinish()
}

class ViewMoreVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet var btnClose: UIButton!
    
    //MARK: - Variables
    var delegate:ViewMoreDelegate?
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentSizeInPopup = CGSize(width: CGFloat(289.0).getProprtionalWidth(), height: CGFloat(385.0).getProprtionalHeight())
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Other functions
    
    @IBAction func btnCloseClicked(_ sender: UIButton) {
        delegate?.viewMoreFinish()
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Actions
    
}
