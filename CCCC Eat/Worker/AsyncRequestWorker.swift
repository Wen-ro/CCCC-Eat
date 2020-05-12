//
//  AsyncRequestWorker.swift
//  SuperShop
//
//  Created by 房懷安 on 2018/10/16.
//  Copyright © 2018 房懷安. All rights reserved.
//

import Foundation
import UIKit

protocol AsyncReponseDelegate {
    func receviedReponse(_ sender: AsyncRequestWorker, responseString : String, tag : Int) -> Void
    func receivedErrorMessage(_ sender:AsyncRequestWorker, errorString : String, tag : Int) -> Void
}

class AsyncRequestWorker: NSObject {

    var reponseDelegate : AsyncReponseDelegate?
    
    func getResponse(from:String, tag:Int) -> Void {
        
        let url = URL(string: from)!
        let request = URLRequest(url: url)
        
        let config = URLSessionConfiguration.default
        
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if( 200 == statusCode){
                
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let responseString = String( dataString! )
                
                // delegate
                self.reponseDelegate?.receviedReponse(self, responseString: responseString, tag: tag)
                
                // notitication
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AsyncRequestWorker.Response"), object: self, userInfo: ["response" :responseString ])
            }
            else{
                
                // delegate
                self.reponseDelegate?.receivedErrorMessage(self, errorString: "\(statusCode)", tag: tag)
                
                // notitication
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AsyncRequestWorker.Error"), object: self, userInfo: ["response" : "\(statusCode)" ])
            }
            
        })
        task.resume()
    }
}
