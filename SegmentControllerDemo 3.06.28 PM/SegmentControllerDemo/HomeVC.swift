//
//  HomeVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/5/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit
import STPopup

class HomeVC: UIViewController {
  //MARK: - Outlets -
  @IBOutlet var containerView: UIView!
  
  //MARK: - Variables -
  var segment: TZSegmentedControl?

  //MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
      segment = TZSegmentedControl(sectionTitles: ["TRENDING","EDITOR'S PICKS", "FOR YOU", "VIDEOS", "MORE"], sectionImages: [
        UIImage(named: "a")!,
        UIImage(named: "b")!,
        UIImage(named: "c")!,
        UIImage(named: "e")!,
        UIImage(named: "moreselected")!
        ],
                                   selectedImages: [UIImage(named: "s")!,
                                                    UIImage(named: "s")!,
                                                    UIImage(named: "s")!,
                                                    UIImage(named: "s")!,
                                                    UIImage(named: "more")!
        ])
      
      
      
      segment?.backgroundColor = UIColor.red
      segment?.frame = CGRect(x: 0, y: UIApplication.shared.statusBarFrame.size.height, width: UIScreen.main.bounds.width, height: 64)
      segment?.verticalDividerEnabled = false
      
      segment?.segmentWidthStyle = .fixed
      segment?.indicatorWidthPercent = 0.8
      segment?.selectionStyle = .box
      segment?.selectionIndicatorColor = UIColor.lightGray
      segment?.backgroundColor = UIColor.white
      segment?.selectedTitleTextAttributes = [NSForegroundColorAttributeName:UIColor.blue]
      segment?.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGray,
                                      NSFontAttributeName:UIFont(name: "Tahoma", size: 10.0) ?? UIFont.systemFont(ofSize: 9)]
      segment?.indicatorWidthPercent = 0.0
      segment?.indexChangeBlock = { (index) in
        self.segmentSelect(selectedIndex: index)
      }
      self.view.addSubview(segment!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  //MARK: - Other functions -
  
  //MARK: - Actions -
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
      let subCategoryVC = self.storyboard?.instantiateViewController(withIdentifier: "SubCategoryVC") as! SubCategoryVC
      self.pushToViewControllerWithClass(subCategoryVC, andAnimated: true)
      // sender.insertSegment(withTitle: "Red", image: UIImage.init(named: "segment-4"), at: 1)
//      let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "RedViewController") as! RedViewController
//      vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
//      self.addChildViewController(vc2)
//      self.containerView.addSubview(vc2.view)
//      vc2.didMove(toParentViewController: self)
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
      let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewMoreVC") as! ViewMoreVC
      let stVC = STPopupController.init(rootViewController: vc)
      //  stVC.backgroundView?.backgroundColor = UIColor.black
      stVC.style = .formSheet
      stVC.transitionStyle = .fade
      stVC.present(in: self)
      // self.showAlertWithTitleForTime(strTitle: "Naresh alert", andMessage: "testing", andOkButtonTitle: "OK")
    }
    
  }
}
