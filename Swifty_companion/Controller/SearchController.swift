//
//  ViewController.swift
//  Swifty_companion
//
//  Created by Nguyen Tam Anh Bui on 3/22/18.
//  Copyright © 2018 Nguyen Tam Anh Bui. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchController: UIViewController {
    
    let auth = AppAuth()
    @IBOutlet weak var searchedForUser: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("In viewDidLoad SearchController") // TESTING
        auth.get_token()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
    }
    
    func extractProfile(_ completion: JSON?) -> ProfileInfo {
        var profileExtract = ProfileInfo()
        
        profileExtract.login = (completion?["login"].rawString()) ?? ""
        profileExtract.email = (completion?["email"].rawString()) ?? ""
        profileExtract.wallet = (completion?["wallet"].rawString()) ?? ""
        profileExtract.phone = (completion?["phone"].rawString()) ?? ""
        profileExtract.level = (completion?["cursus_users"][0]["level"].rawString()) ?? ""
        profileExtract.imageURL = (completion?["image_url"].rawString()) ?? ""        
        return profileExtract
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { fatalError("Segue has no identifier") }
        if identifier == "userProfileSegue" {
            let destinationVC = segue.destination as! ProfileController
            var profileExtract = ProfileInfo()
            
            if let username = searchedForUser.text {
                destinationVC.username = username
                auth.get_user("tbui") { // TESTING ,  make tbui into username
                    completion in
                    if completion == nil {
                        fatalError("Completion handler of get_user was misused") // TESTING
                    } else {
                        print("performing userProfileSegue")
                        profileExtract = self.extractProfile(completion)
                        destinationVC.profile = profileExtract
                        destinationVC.prepareProfile()
                    }
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}

