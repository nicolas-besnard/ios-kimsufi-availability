//
//  User.swift
//  KimsufiStock
//
//  Created by Nicolas Besnard on 22/08/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation

class User : NSObject
{
    var id : Int! {
        get
        {
            if let id: AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey("userId") {
                return id as Int!
            }
            return nil
        }
        set
        {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "userId")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    var token : String! {
        get
        {
            if let token: AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey("userToken") {
                return token as String!
            }
            return nil
        }
        set
        {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "userToken")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    var ks1 : Bool! {
        get
        {
            if let ks1: AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey("userks1") {
                return ks1 as Bool!
            }
            return nil
        }
        set
        {
            willChangeValueForKey("ks1")
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "userks1")
            NSUserDefaults.standardUserDefaults().synchronize()
            didChangeValueForKey("ks1")
        }
    }
    
    var ks2 : Bool! {
        get
        {
            if let ks2: AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey("userks2") {
                return ks2 as Bool!
            }
            return nil
        }
        set
        {
            willChangeValueForKey("ks2")
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "userks2")
            NSUserDefaults.standardUserDefaults().synchronize()
            didChangeValueForKey("ks2")
        }
    }
    
    var ks3 : Bool! {
        get
        {
            if let ks3: AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey("userks3") {
                return ks3 as Bool!
            }
            return nil
        }
        set
        {
            willChangeValueForKey("ks3")
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "userks3")
            NSUserDefaults.standardUserDefaults().synchronize()
            didChangeValueForKey("ks3")
        }
    }
    
    var ks4 : Bool! {
        get
        {
            if let ks4: AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey("userks4") {
                return ks4 as Bool!
            }
            return nil
        }
        set
        {
            willChangeValueForKey("ks4")
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "userks4")
            NSUserDefaults.standardUserDefaults().synchronize()
            didChangeValueForKey("ks4")
        }
    }
    
    var ks5a : Bool! {
        get
        {
            if let ks5a: AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey("userks5a") {
                return ks5a as Bool!
            }
            return nil
        }
        set
        {
            willChangeValueForKey("ks5a")
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "userks5a")
            NSUserDefaults.standardUserDefaults().synchronize()
            didChangeValueForKey("ks5a")
        }
    }
    
    var ks5b : Bool! {
        get
        {
            if let ks5b: AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey("userks5b") {
                return ks5b as Bool!
            }
            return nil
        }
        set
        {
            willChangeValueForKey("ks5b")
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "userks5b")
            NSUserDefaults.standardUserDefaults().synchronize()
            didChangeValueForKey("ks5b")
        }
    }
    
    var ks6 : Bool! {
        get
        {
            if let ks6: AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey("userks6") {
                return ks6 as Bool!
            }
            return nil
        }
        set
        {
            willChangeValueForKey("ks6")
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "userks6")
            NSUserDefaults.standardUserDefaults().synchronize()
            didChangeValueForKey("ks6")
        }
    }
    
    func dataFromVO(vo : UserVO)
    {
        self.id = vo.id
        self.token = vo.token
        self.ks1 = Bool(vo.ks1)
        self.ks2 = Bool(vo.ks2)
        self.ks3 = Bool(vo.ks3)
        self.ks4 = Bool(vo.ks4)
        self.ks5a = Bool(vo.ks5a)
        self.ks5b = Bool(vo.ks5b)
        self.ks6 = Bool(vo.ks6)
    }
}
