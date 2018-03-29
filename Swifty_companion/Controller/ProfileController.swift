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
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
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
        
    func loadImage(_ strURL: String) {
        print("Inside of loadimage")
        print(strURL)
        if let url = NSURL(string: strURL) {
            if let data = NSData(contentsOf: url as URL) {
                profileImage.image = UIImage(data: data as Data)
            } else {
                fatalError("Error in the loading of image")
            }
        }
        
    }
    
    func prepareProfile() {
        usernameLabel.text = self.profile?.login
        emailLabel.text = self.profile?.email
        phoneLabel.text = self.profile?.phone
        if let imageURL = self.profile?.imageURL { loadImage(imageURL) }
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
