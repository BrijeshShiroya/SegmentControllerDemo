//
//  API.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/25/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import AlamofireSwiftyJSON
import Alamofire

let KEY_SUCCESS = "success"
let KEY_DATA = "data"
let KEY_MESSAGE = "message"
let KEY_STATUS_CODE = "status_code"

private let _sharedInstance = API()

class API{
   init() {
    
  }
  class var sharedInstance:API{
    return _sharedInstance
  }
 
  //MARK: - API- normal parameter

  //This function is calling when you know about the httpmethod or In case of compulsory to give          of http method. you must go to with particular httpmethod.
  class func getResponseFromApi(strUrl:String,param:Dictionary<String, String>? = nil ,withHTTPMethod HTTPMethod:Alamofire.HTTPMethod, completionHandler: @escaping (_ result: NSDictionary) -> Void) -> Void
  {
    //make new url from baseurl and argumented url
    Alamofire.request(strUrl, method: HTTPMethod, parameters: param, encoding: URLEncoding.default, headers: nil).validate().responseJSON { (response) in
      completionHandler(API.returnResponse(response: response))
    }
  }
  
  //MARK: - API- Image with normal parameter

  // function for data + image parameter
  class func uploadImageWithData(strApiUrl:String,requestParamImage:Dictionary<String, String>? = nil,requestParamData:Dictionary<String, String>? = nil ,completionHandler: @escaping (_ result: NSDictionary) -> Void) -> Void{
    Alamofire.upload(multipartFormData: { multipartFormData in
      //get all image parameter and append
      for (key, value) in requestParamImage!{
        let urlImage:URL = URL.init(fileURLWithPath: value)
        multipartFormData.append(urlImage, withName: key)
      }
      //get data and append
      for (key, value) in requestParamData! {
        multipartFormData.append(value.data(using:String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
      }
    }, to: strApiUrl, encodingCompletion: {
      (encodingResult) in
      print("encoding result:\(encodingResult)")
      switch encodingResult {
      case .success(let upload, _, _):
        upload.uploadProgress(closure: { (Progress) in
          print("Upload Progress: \(Progress.fractionCompleted)")
          //send progress using delegate
        })
        upload.responseJSON{ (response) in
          completionHandler(API.returnResponse(response: response))
        }
      case .failure(let encodingError):
        print(encodingError)
      }
    })
  }
  
  //return response and validate response
  class func returnResponse (response: DataResponse<Any>)->NSDictionary
  {
    if (response.result.isSuccess)
    {
      if let value = response.result.value
      {
        return value as! NSDictionary
      }
    }
    else
    {
      print("\(String(describing: response.error?.localizedDescription))")
      var statusCode = 0
      if let error = response.result.error as? AFError {
        statusCode = error._code // statusCode private
        switch error {
        case .invalidURL(let url):
          print("Invalid URL: \(url) - \(error.localizedDescription)")
        case .parameterEncodingFailed(let reason):
          print("Parameter encoding failed: \(error.localizedDescription)")
          print("Failure Reason: \(reason)")
        case .multipartEncodingFailed(let reason):
          print("Multipart encoding failed: \(error.localizedDescription)")
          print("Failure Reason: \(reason)")
        case .responseValidationFailed(let reason):
          print("Response validation failed: \(error.localizedDescription)")
          print("Failure Reason: \(reason)")
          
          switch reason {
          case .dataFileNil, .dataFileReadFailed:
            print("Downloaded file could not be read")
          case .missingContentType(let acceptableContentTypes):
            print("Content Type Missing: \(acceptableContentTypes)")
          case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
            print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
          case .unacceptableStatusCode(let code):
            print("Response status code was unacceptable: \(code)")
            statusCode = code
          }
        case .responseSerializationFailed(let reason):
          print("Response serialization failed: \(error.localizedDescription)")
          print("Failure Reason: \(reason)")
          // statusCode = 3840 ???? maybe..
        }
        
        print("Underlying error: \(String(describing: error.underlyingError))")
      } else if let error = response.result.error as? URLError {
        print("URLError occurred: \(error)")
      }else if let error = response.result.error as NSError?{
        print("timeout")
        statusCode = error._code
      }else {
        print("Unknown error: \(String(describing: response.result.error))")
      }
      
      print(statusCode)
      //make a response with nil value and set error or other information in it and return it.
      let paramDic:NSMutableDictionary = NSMutableDictionary()
      paramDic[KEY_MESSAGE] = response.error?.localizedDescription
      paramDic[KEY_DATA] = nil
      paramDic[KEY_STATUS_CODE] = "\(statusCode)"
      paramDic[KEY_SUCCESS] = 0
      
      return paramDic as NSDictionary
    }
    return NSDictionary()
  }

}
