//
//  UIImage+Extension.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/22/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import UIKit

public enum ImageFormat {
    case PNG
    case JPEG(CGFloat)
}


extension UIImage {
    //convert image to base64 string
    func toBase64(format: ImageFormat) -> String {
        var imageData: NSData
        switch format {
        case .PNG: imageData = UIImagePNGRepresentation(self)! as NSData
        case .JPEG(let compression): imageData = UIImageJPEGRepresentation(self, compression)! as NSData
        }
        return imageData.base64EncodedString(options: .lineLength64Characters)
    }
    
    //convert string to image
    class func base64ToImage(toImage strEncodeData: String) -> UIImage {
        let dataDecoded  = NSData(base64Encoded: strEncodeData, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)!
        let image = UIImage(data: dataDecoded as Data)
        return image!
    }
    
    //Function for store file/Image into local directory. If image is already on the directory then first remove it and replace new image/File on that location
    func storedFileIntoLocal(strImageName:String) -> String{
        var strPath = ""
        let documentDirectory1 = NSString.init(string: String.documentDirectory())
        let imageName:String = strImageName + ".png"
        let imagePath = documentDirectory1.appendingPathComponent(imageName)
        strPath = imagePath
        let fileManager = FileManager.default
        let isExist = fileManager.fileExists(atPath: String.init(imagePath))
        if(isExist == true)
        {
            do {
                try fileManager.removeItem(atPath: imagePath as String)//removing file if exist
                // print("Remove success")
            } catch {
                print(error)
            }
        }
        let imageData:Data = UIImageJPEGRepresentation(self, 0.5)!
        do {
            try imageData.write(to: URL(fileURLWithPath: imagePath as String), options: .atomic)
        } catch {
            print(error)
            strPath = "Failed to cache image data to disk"
            return strPath
        }
        
        return strPath
    }
    
    
    //function for resize image
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        
        let widthRatio  = targetSize.width  / self.size.width
        let heightRatio = targetSize.height / self.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            //                        newSize = size
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}


extension String{
    /*
     - Email validation. - done
     - Mobile number validation. -  done
     - trimming. -  done
     - String to Bool conversion. -  done
     - Finding String length.
     - Check particular string available or not into String. -  done
     - Replace string - done
     - Finding height using string. - done
     - Make attributed string -
     - concatenation of string - done
     - generate random string and number - done
     - String to array - done
     - Convert to encode and decode - done
     - Alphanumeric, numeric - done - done
     - CharacterSet -
     */
    
    //catch path directory
    static func documentDirectory() -> String{
        return (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
    }
    
    //Email Validation
    func isEmailAddress() -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    //Trimming
    //removing whitespace (remove space from leading and trailing  of text)
    func trim() -> String{
        let strTrimmed = (NSString(string:self)).trimmingCharacters(in: CharacterSet.whitespaces)
        return strTrimmed
    }
    
    
    // Mobile Validation
    func isMobile() -> Bool{
        let PHONE_REGEX = "^\\d{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    
    //get height based on text
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height + 24
    }
    
    //convert string to boolean
    func toBool() -> Bool? {
        let str = self.lowercased()
        switch str {
        case "true", "yes", "1":
            return true
        case "false", "no", "0":
            return false
        default:
            return nil
        }
    }
    
    
    //replce oldstring by new string
    func replace(target: String, withString: String) -> String{
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
    
    //check text contains or not - remove caseSensivity
    func contains(matchedString:String) -> Bool{
        if((self.range(of: matchedString, options: String.CompareOptions.caseInsensitive, range: nil, locale: nil)) != nil){
            return true
        }else{
            return false
        }
    }
    
    
    //string contains numbers or not
    var isNumeric:Bool{
        let numberRegEx  = ".*[0-9]+.*"
        let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return testCase.evaluate(with: self)
    }
    
    //checkalphanumric value or not
    var isAlphaNumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    //check special character value or not
    var isSpecialCharacter: Bool{
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        if self.rangeOfCharacter(from: characterset.inverted) != nil {
            return true
        }
        return false
    }
    
    //convert string to base64 String
    func encodeFromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
    //convert base64 string to string
    func decodeToBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    //convert string into array by character seprated string
    func stringToArray(sepratedString:String) -> [String]{
        return self.components(separatedBy: sepratedString)
    }
    
    //generate random string
    static func randomString(length:Int) -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        return randomString
    }
    
    //convert string to CGFloat
    func toCGFloat() -> CGFloat{
        if let n = NumberFormatter().number(from: self.trim()){
            return n as! CGFloat
        }
        return 0
    }
    
    //string to URL
    func toURL() -> URL{
        return URL.init(string: self)!
    }
}

