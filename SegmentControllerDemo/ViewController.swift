//
//  ViewController.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 9/26/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   @IBOutlet weak var segmentedControl: ScrollableSegmentedControl!
  
  @IBOutlet var containerView: UIView!
  var selectedIndexPath = IndexPath(row: 0, section: 0)
  var selectedAttributesIndexPath = IndexPath(row: 0, section: 1)
  
  let largerRedTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 16),
                                 NSForegroundColorAttributeName: UIColor.red]
  let largerRedTextHighlightAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 16),
                                          NSForegroundColorAttributeName: UIColor.blue]
  let largerRedTextSelectAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 16),
                                       NSForegroundColorAttributeName: UIColor.orange]

  override func viewDidLoad() {
    super.viewDidLoad()
    segmentedControl.backgroundColor = UIColor.brown
    segmentedControl.segmentStyle = .textOnly
    segmentedControl.insertSegment(withTitle: "White", image: nil, at: 0)
    segmentedControl.insertSegment(withTitle: "Red", image: nil , at: 1)
    segmentedControl.insertSegment(withTitle: "Green", image: nil, at: 2)
    segmentedControl.insertSegment(withTitle: "Blue", image: nil, at: 3)
    
    segmentedControl.underlineSelected = true
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.addTarget(self, action: #selector(ViewController.segmentSelected(sender:)), for: .valueChanged)
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func segmentSelected(sender:ScrollableSegmentedControl) {
    print("Segment at index \(sender.selectedSegmentIndex)  selected")
    if sender.selectedSegmentIndex == 0{
      let viewControllers:[UIViewController] = self.childViewControllers
      for viewContoller in viewControllers{
        viewContoller.willMove(toParentViewController: nil)
        viewContoller.view.removeFromSuperview()
        viewContoller.removeFromParentViewController()
      }
    }else if sender.selectedSegmentIndex == 1{
      let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "RedViewController") as! RedViewController
      vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
      self.addChildViewController(vc2)
      self.containerView.addSubview(vc2.view)
      vc2.didMove(toParentViewController: self)
    }else if sender.selectedSegmentIndex == 2{
      let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
      vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
      self.addChildViewController(vc2)
      self.containerView.addSubview(vc2.view)
      vc2.didMove(toParentViewController: self)
    }else if sender.selectedSegmentIndex == 3{
      let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "BlueViewController") as! BlueViewController
      vc2.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
      self.addChildViewController(vc2)
      self.containerView.addSubview(vc2.view)
      vc2.didMove(toParentViewController: self)
    }
  }
  


}

