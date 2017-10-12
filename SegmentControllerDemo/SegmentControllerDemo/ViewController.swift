//
//  ViewController.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 9/26/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit
import STPopup

class ViewController: UIViewController {
    
    
    //TODO: - Outlets -
    @IBOutlet var ViewMore: UIView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var tabbar: UITabBar!
    var currentVC:UIViewController?
    
    //TODO: - Variables -
    var segment: TZSegmentedControl?
    var controllerName:String = "ViewController"    
    
    //TODO: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.currentVC = delegate?.getData()
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.addChildViewController(vc2)
        vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
        self.containerView.addSubview(vc2.view)
        /*
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
         */
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
       
    }
    
    func didFinishSubCategory(controller: SubCategoryVC) {
        self.addChildViewController(controller)
        controller.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
        self.containerView.addSubview(controller.view)
    }
    
    //TODO:- Other functions -
    /*
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
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewMoreVC") as! ViewMoreVC
            let stVC = STPopupController.init(rootViewController: vc)
            //  stVC.backgroundView?.backgroundColor = UIColor.black
            stVC.style = .formSheet
            stVC.transitionStyle = .fade
            stVC.present(in: self)
            // self.showAlertWithTitleForTime(strTitle: "Naresh alert", andMessage: "testing", andOkButtonTitle: "OK")
        }
        
    }
 */
}

extension ViewController:UITabBarDelegate{
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        //resetSegment()
        let selectedIndex = item.tag
        print("selected tab at index \(item.tag)  selected")
        if selectedIndex == 1{
            self.navigationController?.isNavigationBarHidden = true
            let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            self.addChildViewController(vc2)
            vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
            self.containerView.addSubview(vc2.view)
        }else if selectedIndex == 2{
            // sender.insertSegment(withTitle: "Red", image: UIImage.init(named: "segment-4"), at: 1)
            let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "FavoriteListVC") as! FavoriteListVC
            self.addChildViewController(vc2)
            vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
            self.containerView.addSubview(vc2.view)
            
            vc2.didMove(toParentViewController: self)
        }else if selectedIndex == 3{
            let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "MyPurchaseVC") as! MyPurchaseVC
            self.addChildViewController(vc2)
            vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
            self.containerView.addSubview(vc2.view)
            
            vc2.didMove(toParentViewController: self)
        }else if selectedIndex == 4{
            let vc2 = STORYBOARD_NOTIFICATION.instantiateViewController(withIdentifier: "NotificationListVC") as! NotificationListVC
            vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
            self.addChildViewController(vc2)
            self.containerView.addSubview(vc2.view)
            vc2.didMove(toParentViewController: self)
        }
        else if selectedIndex == 5{
            let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
            vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
            self.addChildViewController(vc2)
            self.containerView.addSubview(vc2.view)
            vc2.didMove(toParentViewController: self)
            /*
             let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewMoreVC") as! ViewMoreVC
             let stVC = STPopupController.init(rootViewController: vc)
             //  stVC.backgroundView?.backgroundColor = UIColor.black
             stVC.style = .formSheet
             stVC.transitionStyle = .fade
             stVC.present(in: self)
             */
        }
        
    }
}
/*
 
 extension UIViewController{
 
 //show basic type alert
 func showAlertWithTitle(strTitle:String, andMessage strMsg:String, andOkButtonTitle okButtonTitle:String)
 {
 let alertViewController = UIAlertController.init(title: strTitle, message: strMsg, preferredStyle: .alert)
 //make UIAlertController instance with title,msg and style
 let okAction = UIAlertAction(title: okButtonTitle, style: .cancel) { (result : UIAlertAction) -> Void in//make action that perform on ok click
 }
 alertViewController.addAction(okAction) //set action into alertcontroller
 self.present(alertViewController, animated: true, completion: nil)
 }
 
 //show alert for 1 seconds
 func showAlertWithTitleForTime(strTitle:String, andMessage strMsg:String, andOkButtonTitle okButtonTitle:String)
 {
 let alertViewController = UIAlertController.init(title: strTitle, message: strMsg, preferredStyle: .alert)
 self.present(alertViewController, animated: true, completion: nil)
 DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
 alertViewController.dismiss(animated: true, completion: nil)
 })
 }
 
 
 //Function for pop viecontroller if exist in stack of navigation
 func popToViewControllerWithClass(destinationController: UIViewController, andAnimated animated:Bool)
 {
 let arrController:[UIViewController] = (self.navigationController?.viewControllers)!//array of all controllers in navigation stack
 for vc in arrController
 {
 if (type(of: vc)  == type(of: destinationController))//check exist or not
 {
 _ = self.navigationController?.popToViewController((arrController[(arrController.index(of: vc))!]), animated: true)
 break
 }
 }
 }
 //push to other
 func pushToViewControllerWithClass(_ destinationController:UIViewController, andAnimated animated:Bool)
 {
 let arrController = self.navigationController?.viewControllers//array of all controllers in navigation stack
 for vc in arrController!
 {
 if (type(of: vc)  == type(of: destinationController))
 {
 _ = self.navigationController?.popToViewController(arrController![(arrController?.index(of: vc))!], animated: true)
 break
 }
 else
 {
 _ = self.navigationController?.pushViewController(destinationController, animated: animated)
 break
 //if not exist in stack then push
 }
 }
 }
 
 //setup menubar button
 func setupMenuBarButtonItems(isleftButton:Bool, isRightButton:Bool){
 if isleftButton{
 self.navigationItem.leftBarButtonItem =  UIBarButtonItem.init(image: UIImage.init(named: "menu"), style: .plain, target: self, action: #selector(self.leftSideMenuButtonPressed))
 }
 if isRightButton{
 self.navigationItem.rightBarButtonItem =  UIBarButtonItem.init(image: UIImage.init(named: "menu"), style: .plain, target: self, action: #selector(self.rightSideMenuButtonPressed))
 }
 }
 
 func leftSideMenuButtonPressed(){
 print("Pressed left")
 }
 
 func rightSideMenuButtonPressed(){
 print("Pressed right")
 }
 
 }
 */
