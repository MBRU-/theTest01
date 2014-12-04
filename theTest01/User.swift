//
//  User.swift
//  theTest01
//
//  Created by Martin Brunner on 03.12.14.
//  Copyright (c) 2014 Martin Brunner. All rights reserved.
//

import Foundation

var theUser:User?

 struct UserCredential {
    var userName = "noUser"
    var password: NSString = ""
    var isAdmin: Bool = false
}

private var userCredentials: UserCredential = UserCredential()

class User {
        
    init (newName: String, password: String, isAdmin: Bool) {
        userCredentials.userName = newName
        userCredentials.password = password
        userCredentials.isAdmin = isAdmin
    }
    
    func addAccount (newName: String, password: String, isAdmin: Bool) -> Bool {

        var newDict:NSMutableDictionary = NSMutableDictionary()
        
        var newUser = NSMutableDictionary()
        
        newUser.setObject(password, forKey: newName)
        
        if let storedUserDict = NSUserDefaults.standardUserDefaults().dictionaryForKey(kUserCredentialsKey) {
            newDict.setDictionary((NSUserDefaults.standardUserDefaults().dictionaryForKey(kUserCredentialsKey) )!)
            if newDict.objectForKey(User.credentials().userName) == nil {
                newDict.addEntriesFromDictionary(newUser )
            }
            else {
                //User already exists with this name
                return false
            }
        }
        else {
            newDict.setDictionary(newUser)
        }
        
        NSUserDefaults.standardUserDefaults().setObject(newDict, forKey: kUserCredentialsKey)
        NSUserDefaults.standardUserDefaults().synchronize()
        
        return true
       
    }

    
    class func credentials() -> UserCredential {
        
        return userCredentials
    }
    
    class func isAdmin () -> Bool {
        return userCredentials.isAdmin
    }
    
    class func verifyPassword (password: NSString) -> Bool {
        if userCredentials.password.uppercaseString == password.uppercaseString {
            return true
        }
        else {
            return false
        }
    }
    
}
