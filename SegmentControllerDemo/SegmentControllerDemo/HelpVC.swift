//
//  HelpVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/5/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class HelpVC: UIViewController {
  //TODO: - Outlets -
  @IBOutlet var containerView: UIView!

  //TODO: - Variables -
  var segment: TZSegmentedControl?

  //TODO: - Life cycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    configSegment()
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.setTitle(strTitle: "Settings")
    self.navigationController?.isNavigationBarHidden = false
  }
  
  
  //TODO: - Other functions -
  
  func configSegment(){
    let segment = TZSegmentedControl(sectionTitles: ["FAQs","Policy","Promises"])
    segment.frame = CGRect(x: 0, y: UIApplication.shared.statusBarFrame.size.height + 44.0, width: UIScreen.main.bounds.width, height: 50)
    
    segment.segmentWidthStyle = .fixed
    segment.indicatorWidthPercent = 1.0
    segment.indexChangeBlock = { (index) in
      self.segmentSelect(selectedIndex: index)
    }
    self.view.addSubview(segment)
    
  }
  
  //TODO: - Actions -
  
  func segmentSelect(selectedIndex:Int){
    //resetSegment()
    print("Segment at index \(selectedIndex)  selected")
    if selectedIndex == 0{
      let viewControllers:[UIViewController] = self.childViewControllers
      for viewContoller in viewControllers{
        viewContoller.willMove(toParentViewController: nil)
        viewContoller.view.removeFromSuperview()
        viewContoller.removeFromParentViewController()
      }
    }else if selectedIndex == 1{
      // sender.insertSegment(withTitle: "Red", image: UIImage.init(named: "segment-4"), at: 1)
      let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "RedViewController") as! RedViewController
      vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
      self.addChildViewController(vc2)
      self.containerView.addSubview(vc2.view)
      vc2.didMove(toParentViewController: self)
    }else if selectedIndex == 2{
      
      let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
      self.addChildViewController(vc2)
      vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
      self.containerView.addSubview(vc2.view)
      
      vc2.didMove(toParentViewController: self)
    }else if selectedIndex == 3{
      let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "CategoryListVC") as! CategoryListVC
      vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
      self.addChildViewController(vc2)
      self.containerView.addSubview(vc2.view)
      vc2.didMove(toParentViewController: self)
    }
    else if selectedIndex == 4{
    
      // self.showAlertWithTitleForTime(strTitle: "Naresh alert", andMessage: "testing", andOkButtonTitle: "OK")
    }
  }
}
