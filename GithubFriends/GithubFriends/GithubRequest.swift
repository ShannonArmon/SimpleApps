//
//  GithubRequest.swift
//  GithubFriends
//
//  Created by Shannon Armon on 5/13/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

class GithubRequest: NSObject {
    
    class func getInfoWithEnpoint(endpoint: String) -> AnyObject? {
    
        if let url = NSURL(string: endpoint + "?client_id=18c2e67eaf44f4a60b76&client_secret=5528dd41089fd0a5de62e7927b849075b65463a0") {
            
            let request = NSURLRequest(URL: url)
            
//            println(request)
            
            if let data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil) {
                
//                println(data)
                
                return NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
                
//                if let responseInfo = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? [String: AnyObject] {
//                      <====For unwrapping
//                    
//                    
//                }
                
            }
            
        }

        
        return nil
        
    }
    
}
