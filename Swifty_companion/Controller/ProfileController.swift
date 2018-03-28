//
//  ProfileController.swift
//  Swifty_companion
//
//  Created by Nguyen Tam Anh Bui on 3/24/18.
//  Copyright © 2018 Nguyen Tam Anh Bui. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {

    var username : String?
    var profile : ProfileInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("In viewDidLoad ProfileController") // TESTING
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareProfile() {
        print(profile)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
