//
//  AppAuth.swift
//  Swifty_companion
//
//  Created by Nguyen Tam Anh Bui on 3/24/18.
//  Copyright © 2018 Nguyen Tam Anh Bui. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class AppAuth {
    
    var token : String?
    
    let url = "https://api.intra.42.fr/oauth/token"
    let config = [
        "grant_type" : "client_credentials",
        "client_id": "f65f82e2a028a09b14fd379a8d0225bb35389068f7290fe45974e0b4639f82a8",
        "client_secret": "f286fe7d068d8a76a050aef87229c2fb4a3fdddbc7c9b19f720f8e0118c0ccc0"]
    
    func get_token() {
        print("In get_token()")
        if self.token == nil {
            Alamofire.request(url, method: .post, parameters: config).responseJSON { (response) in
                print(response.result)
                switch response.result {
                case .success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        self.token = json["access_token"].stringValue
                        UserDefaults.standard.set(self.token, forKey: "token") //setObject
                        
                        print(json) // TESTING
                        self.check_token()
                    }
                case .failure:
                    print("Failure")
                }
                
            }
        }
    }
    
    private func check_token() {
        print("Inside of check_token()")
        let urlCheck = NSURL(string: "https://api.intra.42.fr/oauth/token/info")
        let bearer = "Bearer " + self.token!
        var request = URLRequest(url: urlCheck! as URL)
        request.httpMethod = "GET"
        request.setValue(bearer, forHTTPHeaderField: "Authorization")
        print(request)
        
        Alamofire.request(request).validate().responseJSON { response in
            switch response.result {
            case .success:
                print("Validation successful")
            // print(UserDefaults.standard.string(forKey: "token")) // Print out the token in the user defaults
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func get_user(_ username: String, completion: @escaping (JSON?) -> Void) {
        let urlCheck = NSURL(string: "https://api.intra.42.fr/v2/users/" + username)
        let bearer = "Bearer " + self.token!
        print(bearer)
        var request = URLRequest(url: urlCheck! as URL)
        request.httpMethod = "GET"
        request.setValue(bearer, forHTTPHeaderField: "Authorization")
        
        Alamofire.request(request).validate().responseJSON { response in
            switch response.result {
            case .success:
                print("user Validation successful")
                if let value = response.result.value {
                    let json = JSON(value)
                    // calls the callback function to take care of the json
                    completion(json)
                }
            case .failure(let error):
                print("Error in user Validation")
                print(error)
            }
        }
        
    }
    
    
    
    
    
}
