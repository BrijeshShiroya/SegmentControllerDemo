//
//  Constant.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/22/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import UIKit

//screentype for change fontsize based on screem
enum defaultScreenType{
    case big
    case small
}
//MARK: - Device and Screen

let IS_IPAD = (UIDevice.current.userInterfaceIdiom == .pad)
let IS_IPHONE = (UIDevice.current.userInterfaceIdiom == .phone)

let SCREEN_MAX_LENGTH = (max(SCREEN_WIDTH, SCREEN_HEIGHT))
let SCREEN_MIN_LENGTH = (min(SCREEN_WIDTH, SCREEN_HEIGHT))

let IS_IPHONE_4_OR_LESS = (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
let IS_IPHONE_5 = (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
let IS_IPHONE_6 = (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
let IS_IPHONE_6P = (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height


let STORYBOARD_MAIN = UIStoryboard.init(name: "Main", bundle: nil)
let STORYBOARD_NOTIFICATION = UIStoryboard.init(name: "Notification", bundle: nil)
let STORYBOARD_MYPURCHASE = UIStoryboard.init(name: "MyPurchase", bundle: nil)
let USERDEFAULT = UserDefaults.standard


let APPDELEGATE = UIApplication.shared.delegate as! AppDelegate

let DEFAULT_SCREEN = defaultScreenType.small
