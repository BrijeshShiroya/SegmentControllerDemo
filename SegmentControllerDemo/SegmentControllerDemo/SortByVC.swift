//
//  SortByVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/26/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit
protocol SortByDelegate {
    func sortByFinish()
}
class SortByVC: UIViewController {

    //MARK: - Outlets

    @IBOutlet var btnClose: UIButton!
    //MARK: - Variables
    var delegate:SortByDelegate?

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentSizeInPopup = CGSize(width: CGFloat(289.0).getProprtionalWidth(), height: 250.0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - Other functions
    
    //MARK: - Actions

    @IBAction func btnCloseClicked(_ sender: UIButton) {
        delegate?.sortByFinish()
        self.dismiss(animated: true, completion: nil)
    }
}
