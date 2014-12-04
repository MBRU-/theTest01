//
//  SecondViewController.swift
//  theTest01
//
//  Created by Martin Brunner on 04.12.14.
//  Copyright (c) 2014 Martin Brunner. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var userNameTextLabel: UILabel!
    @IBOutlet weak var passwordTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newDict:NSMutableDictionary = NSMutableDictionary()
        
        newDict.setDictionary((NSUserDefaults.standardUserDefaults().dictionaryForKey(kUserCredentialsKey) )!)
        passwordTextLabel.text = (newDict.objectForKey(User.credentials().userName) as String)
        userNameTextLabel.text = User.credentials().userName
        
        println("Count:\(newDict.count)")
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
