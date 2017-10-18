//
//  HomeVC.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 10/5/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit
import STPopup

class HomeVC: UIViewController,ViewMoreDelegate {
    //MARK: - Outlets -
    @IBOutlet var containerView: UIView!
    
    //MARK: - Variables -
    var segment: TZSegmentedControl?
    
    //MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSegment()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setTitle(strTitle: "")
    }
    
   
    //MARK: - Other functions -
    //Viewmore delegate
    
    func viewMoreFinish() {
        self.segment?.selectedSegmentIndex = 0
    }
    
    //subcategory delegate
    func didFinishSubCategory(strTitle:String) {
        
        let viewControllers:[UIViewController] = self.childViewControllers
        for viewContoller in viewControllers{
            viewContoller.willMove(toParentViewController: nil)
            viewContoller.view.removeFromSuperview()
            viewContoller.removeFromParentViewController()
        }
        let homeScrollVC = self.storyboard?.instantiateViewController(withIdentifier: "CategoryListVC") as! CategoryListVC
        homeScrollVC.strCategoryName = strTitle
        self.addChildViewController(homeScrollVC)
        homeScrollVC.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
        self.containerView.addSubview(homeScrollVC.view)
    }
    
    //set segment value and add into view
    func setSegment(){
        segment = TZSegmentedControl(sectionTitles: ["Goods","Dining Out", "Services", "Spa & Salon", "More"], sectionImages: [
            UIImage(named: "a")!,
            UIImage(named: "b")!,
            UIImage(named: "c")!,
            UIImage(named: "e")!,
            UIImage(named: "moreselected")!
            ],
                                     selectedImages: [UIImage(named: "a")!,
                                                      UIImage(named: "b")!,
                                                      UIImage(named: "c")!,
                                                      UIImage(named: "e")!,
                                                      UIImage(named: "moreselected")!
            ])
        
        
        
        segment?.backgroundColor = UIColor.red
        segment?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64)
        segment?.verticalDividerEnabled = false
        segment?.segmentWidthStyle = .fixed
        segment?.indicatorWidthPercent = 0.8
//      segment?.selectionStyle = .box
        segment?.selectionIndicatorColor = UIColor.lightGray
        segment?.backgroundColor = UIColor.white
        segment?.selectedTitleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGray]
        segment?.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGray,
                                        NSFontAttributeName:UIFont(name: "Tahoma", size: 10.0) ?? UIFont.systemFont(ofSize: 9)]
        segment?.indicatorWidthPercent = 0.0
        segment?.indexChangeBlock = { (index) in
            self.segmentSelect(selectedIndex: index)
        }
        self.view.addSubview(segment!)
        let homeScrollVC = self.storyboard?.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
        self.addChildViewController(homeScrollVC)
        homeScrollVC.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
        self.containerView.addSubview(homeScrollVC.view)
    }
    
    //MARK: - Actions -
    func segmentSelect(selectedIndex:Int){
        //resetSegment()
        print("Segment at index \(selectedIndex)  selected")
        if selectedIndex == 0{
            let homeScrollVC = self.storyboard?.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
            self.addChildViewController(homeScrollVC)
            homeScrollVC.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
            self.containerView.addSubview(homeScrollVC.view)
            //            let viewControllers:[UIViewController] = self.childViewControllers
            //            for viewContoller in viewControllers{
            //                viewContoller.willMove(toParentViewController: nil)
            //                viewContoller.view.removeFromSuperview()
            //                viewContoller.removeFromParentViewController()
            //            }
        }else if selectedIndex == 1{
            let subCategoryVC = self.storyboard?.instantiateViewController(withIdentifier: "SubCategoryVC") as! SubCategoryVC
            self.pushToViewControllerWithClass(subCategoryVC, andAnimated: true)
        }else if selectedIndex == 2{
            let subCategoryVC = self.storyboard?.instantiateViewController(withIdentifier: "SubCategoryVC") as! SubCategoryVC
            self.pushToViewControllerWithClass(subCategoryVC, andAnimated: true)
            /*
             let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
             self.addChildViewController(vc2)
             vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
             self.containerView.addSubview(vc2.view)
             
             vc2.didMove(toParentViewController: self)
             */
        }else if selectedIndex == 3{
            let subCategoryVC = self.storyboard?.instantiateViewController(withIdentifier: "SubCategoryVC") as! SubCategoryVC
            self.pushToViewControllerWithClass(subCategoryVC, andAnimated: true)
            /*
             let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "CategoryListVC") as! CategoryListVC
             vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
             self.addChildViewController(vc2)
             self.containerView.addSubview(vc2.view)
             vc2.didMove(toParentViewController: self)
             */
        }
        else if selectedIndex == 4{
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewMoreVC") as! ViewMoreVC
            vc.delegate = self
            vc.contentSizeInPopup = CGSize(width: CGFloat(289.0).getProprtionalWidth(), height: CGFloat(385.0).getProprtionalHeight())
            let stVC = STPopupController.init(rootViewController: vc)
            //  stVC.backgroundView?.backgroundColor = UIColor.black
            stVC.style = .formSheet
            stVC.navigationBarHidden = true
            stVC.transitionStyle = .fade
            stVC.present(in: self)
            
            // self.showAlertWithTitleForTime(strTitle: "Naresh alert", andMessage: "testing", andOkButtonTitle: "OK")
        }
        
    }
}
