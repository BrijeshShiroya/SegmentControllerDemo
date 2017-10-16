//
//  ViewController.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 9/26/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit
import STPopup

extension Dictionary {
    public init(keyValuePairs: [(Key, Value)]) {
        self.init()
        for (pair,value) in keyValuePairs {
            self[pair] = value
        }
    }
}

class ViewController: UIViewController {
    
    
    //MARK: - Outlets -
    @IBOutlet var ViewMore: UIView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var tabbar: UITabBar!
    var currentVC:UIViewController?
    
    //MARK: - Variables -
    var segment: TZSegmentedControl?
    var controllerName:String = "ViewController"    
    
    //MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setSegment()
        self.setNavigationBar()
         //add initially homeVC view in container
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.addChildViewController(vc2)
        vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
        self.containerView.addSubview(vc2.view)
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    //MARK:- NavigationBar -
    
    //resert navigationbar
    func setNavigationBar(){
        self.setupNavigationBar(isLeft: true, isRightFirst: true, isRightSecond: true)
        self.navigationController?.setTitle(strTitle: "")
    }
    override func didTapSearchButton() {
        print("search tap from viewController")
    }
    
    override func didTapCartButton() {
        print("cart tap from viewController")
    }
    
    override func leftSideMenuButtonPressed() {
        print("Select location tap from viewController")
    }
    
    //MARK:- Other functions
    
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
    }
    
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
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewMoreVC") as! ViewMoreVC
            let stVC = STPopupController.init(rootViewController: vc)
            //  stVC.backgroundView?.backgroundColor = UIColor.black
            stVC.style = .formSheet
            stVC.transitionStyle = .fade
            stVC.present(in: self)
        }
        
    }
}

extension ViewController:UITabBarDelegate{
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let selectedIndex = item.tag
        print("selected tab at index \(item.tag)  selected")
        if selectedIndex == 1{
            self.setNavigationBar()//reset navigationbar
            let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            self.addChildViewController(vc2)
            vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
            self.containerView.addSubview(vc2.view)
        }else if selectedIndex == 2{
            self.setupNavigationBar(isLeft: false, isRightFirst: false, isRightSecond: false)
            let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "FavoriteListVC") as! FavoriteListVC
            self.addChildViewController(vc2)
            vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
            self.containerView.addSubview(vc2.view)
            
            vc2.didMove(toParentViewController: self)
        }else if selectedIndex == 3{
            self.setupNavigationBar(isLeft: false, isRightFirst: false, isRightSecond: false)
            let vc2 = STORYBOARD_MYPURCHASE.instantiateViewController(withIdentifier: "MyPurchaseVC") as! MyPurchaseVC
            self.addChildViewController(vc2)
            vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
            self.containerView.addSubview(vc2.view)
            
            vc2.didMove(toParentViewController: self)
        }else if selectedIndex == 4{
            self.setupNavigationBar(isLeft: false, isRightFirst: false, isRightSecond: false)
            let vc2 = STORYBOARD_NOTIFICATION.instantiateViewController(withIdentifier: "NotificationListVC") as! NotificationListVC
            vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
            self.addChildViewController(vc2)
            self.containerView.addSubview(vc2.view)
            vc2.didMove(toParentViewController: self)
        }
        else if selectedIndex == 5{
            self.setupNavigationBar(isLeft: false, isRightFirst: false, isRightSecond: false)
            let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
            vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
            self.addChildViewController(vc2)
            self.containerView.addSubview(vc2.view)
            vc2.didMove(toParentViewController: self)
        }
    }
}
