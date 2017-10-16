//
//  AlertVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/16/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit
protocol AlertDelegate {
    func alertSuccess(success:Bool)
}

class AlertVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet var btnAccept: UIButton!
    @IBOutlet var btnCancel: UIButton!
    @IBOutlet var lblMainTitle: UILabel!
    
    //MARK: - Variables
    var mainTitle = "Awfir"
    var btnAcceptTitle = "Accept"
    var btnCancelTitle = "Cancel"
    var delegate: AlertDelegate?
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentSizeInPopup = CGSize(width: 414, height: 150)
        btnAccept.setTitle(self.btnAcceptTitle, for: .normal)
        btnCancel.setTitle(self.btnCancelTitle, for: .normal)
        self.lblMainTitle.text = self.mainTitle
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    @IBAction func btnAcceptClicked(_ sender: UIButton) {
        delegate?.alertSuccess(success: true)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnCancelClicked(_ sender: UIButton) {
        delegate?.alertSuccess(success: false)
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
