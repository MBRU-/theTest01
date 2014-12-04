//
//  ViewController.swift
//  theTest01
//
//  Created by Martin Brunner on 03.12.14.
//  Copyright (c) 2014 Martin Brunner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickClick(sender: UIButton) {
        
        theUser = User(newName: userNameTextField.text , password: passwordTextField.text, isAdmin: true)
        println(" User: \(User.credentials().userName) \(User.credentials().password)  ")
        
        if theUser?.addAccount(userNameTextField.text, password:  passwordTextField.text, isAdmin: true) == true {
            println("User added: \(userNameTextField.text)")
        }
        else {
            println("User already exists: \(userNameTextField.text)")
        }
        
    }

    @IBAction func searchButtonPressed(sender: UIButton) {
        theUser = User(newName: userNameTextField.text , password: passwordTextField.text, isAdmin: true)
        if let storedUserDict = NSUserDefaults.standardUserDefaults().dictionaryForKey(kUserCredentialsKey) {
            var newDict:NSMutableDictionary = NSMutableDictionary()
            newDict.setDictionary((NSUserDefaults.standardUserDefaults().dictionaryForKey(kUserCredentialsKey) )!)
            println("Name1: \(User.credentials().userName)")
            if let text = (newDict.objectForKey(User.credentials().userName) as? String) {
                passwordTextField.text = text
            }
            for name in newDict {
                    println("Name: \(name.key)")
            }

        }
            }
}

