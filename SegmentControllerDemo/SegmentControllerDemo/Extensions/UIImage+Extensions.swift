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
    
    /// - parameter newSize: newSize the size of the bounds the image must fit within.
    ///
    /// - returns: a new scaled image.
    func scaleImageToSize(newSize: CGSize) -> UIImage {
        var scaledImageRect = CGRect.zero
        
        let aspectWidth = newSize.width/size.width
        let aspectheight = newSize.height/size.height
        
        let aspectRatio = min(aspectWidth, aspectheight)
        
        scaledImageRect.size.width = size.width * aspectRatio;
        scaledImageRect.size.height = size.height * aspectRatio;
        scaledImageRect.origin.x = (newSize.width - scaledImageRect.size.width) / 2.0;
        scaledImageRect.origin.y = (newSize.height - scaledImageRect.size.height) / 2.0;
        
        UIGraphicsBeginImageContext(newSize)
        draw(in: scaledImageRect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage!
    }
/*
    //MARK: - Image scale and rotate
 func scaleAndRotateImage() -> UIImage {
        let imgViewTemp = UIImageView(image: self)
        let kMaxResolution = imgViewTemp.frame.size.width / 2
        let imgRef = self.cgImage!
        let width: CGFloat = CGFloat.init(imgRef.width)//CGFloat(CGImageGetWidth(imgRef))
        let height: CGFloat = CGFloat(CGImageGetHeight(imgRef))
        var transform = CGAffineTransformIdentity
        var bounds = CGRectMake(0, 0, width, height)
        if width > kMaxResolution || height > kMaxResolution {
            let ratio: CGFloat = width / height
            if ratio > 1 {
                bounds.size.width = kMaxResolution
                bounds.size.height = bounds.size.width / ratio
            }
            else {
                bounds.size.height = kMaxResolution
                bounds.size.width = bounds.size.height * ratio
            }
        }
        let scaleRatio: CGFloat = bounds.size.width / width
        let imageSize = CGSizeMake(CGFloat(CGImageGetWidth(imgRef)), CGFloat(CGImageGetHeight(imgRef)))
        var boundHeight: CGFloat
        let orient = image.imageOrientation
        switch orient {
        case .Up:
            //EXIF = 1
            transform = CGAffineTransformIdentity
        case .UpMirrored:
            //EXIF = 2
            transform = CGAffineTransformMakeTranslation(imageSize.width, 0.0)
            transform = CGAffineTransformScale(transform, -1.0, 1.0)
        case .Down:
            //EXIF = 3
            transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height)
            transform = CGAffineTransformRotate(transform, CGFloat(M_PI))
        case .DownMirrored:
            //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.height)
            transform = CGAffineTransformScale(transform, 1.0, -1.0)
        case .LeftMirrored:
            //EXIF = 5
            boundHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundHeight
            transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width)
            transform = CGAffineTransformScale(transform, -1.0, 1.0)
            transform = CGAffineTransformRotate(transform, 3.0 * CGFloat(M_PI / 2.0))
        case .Left:
            //EXIF = 6
            boundHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundHeight
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.width)
            transform = CGAffineTransformRotate(transform, 3.0 * CGFloat(M_PI / 2.0))
        case .RightMirrored:
            //EXIF = 7
            boundHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundHeight
            transform = CGAffineTransformMakeScale(-1.0, 1.0)
            transform = CGAffineTransformRotate(transform, CGFloat(M_PI / 2.0))
        case .Right:
            //EXIF = 8
            boundHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundHeight
            transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0)
            transform = CGAffineTransformRotate(transform, CGFloat(M_PI / 2.0))
        default:
            let error: NSError?
            NSException.raise(NSInternalInconsistencyException, format: "Invalid image orientation", arguments:getVaList([error ?? "nil"]))
        }
        
        UIGraphicsBeginImageContext(bounds.size)
        let context = UIGraphicsGetCurrentContext()
        if orient == .Right || orient == .Left {
            CGContextScaleCTM(context, -scaleRatio, scaleRatio)
            CGContextTranslateCTM(context, -height, 0)
        }
        else {
            CGContextScaleCTM(context, scaleRatio, -scaleRatio)
            CGContextTranslateCTM(context, 0, -height)
        }
        CGContextConcatCTM(context, transform)
        CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef)
        let imageCopy = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageCopy
    }
 */
}



