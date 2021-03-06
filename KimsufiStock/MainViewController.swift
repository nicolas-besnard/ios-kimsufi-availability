//
//  ViewController.swift
//  KimsufiStock
//
//  Created by Nicolas Besnard on 01/08/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, APIServiceProtocol
{
    var apiService: APIService?
    let user = User()
    var needUpdate = false
    
    @IBOutlet weak var ks1Switch: UISwitch!
    @IBOutlet weak var ks2Switch: UISwitch!
    @IBOutlet weak var ks3Switch: UISwitch!
    @IBOutlet weak var ks4Switch: UISwitch!
    @IBOutlet weak var ks5aSwitch: UISwitch!
    @IBOutlet weak var ks5bSwitch: UISwitch!
    @IBOutlet weak var ks6Switch: UISwitch!
    
    @IBAction func ks1SwitchDidChange(sender: AnyObject)
    {
        let s = sender as UISwitch
        
        user.ks1 = s.on
        needUpdate = true
    }
    
    @IBAction func ks2SwitchDidChange(sender: AnyObject)
    {
        let s = sender as UISwitch
        
        user.ks2 = s.on
        needUpdate = true
    }
    
    @IBAction func ks3SwitchDidChange(sender: AnyObject)
    {
        let s = sender as UISwitch
        
        user.ks3 = s.on
        needUpdate = true
    }
    
    @IBAction func ks4SwitchDidChange(sender: AnyObject)
    {
        let s = sender as UISwitch

        user.ks4 = s.on
        needUpdate = true
    }
    
    @IBAction func ks5aSwitchDidChange(sender: AnyObject)
    {
        let s = sender as UISwitch
        
        user.ks5a = s.on
        needUpdate = true
    }
    
    @IBAction func ks5bSwitchDidChange(sender: AnyObject)
    {
        let s = sender as UISwitch
        
        user.ks5b = s.on
        needUpdate = true
    }
    
    @IBAction func ks6SwitchDidChange(sender: AnyObject)
    {
        let s = sender as UISwitch
        
        user.ks6 = s.on
        needUpdate = true
    }

    func deleteData()
    {
        let appDomain = NSBundle.mainBundle().bundleIdentifier!
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.apiService = APIService(delegate: self)
        setupObserver()
//        if user.id == nil
//        {
            self.apiService?.createAccount(token: "1")
//        }
//        else
//        {
//            setSwitch()
//        }
        let timerCounter = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "updateServer", userInfo: nil, repeats: true)
//        askForNotification()
    }
    
    func updateServer()
    {
        if needUpdate
        {
            apiService?.updateUser(user)
            needUpdate = false
        }
    }
    
    func setupObserver()
    {
        self.user.addObserver(self, forKeyPath: "ks1", options: NSKeyValueObservingOptions.Initial, context: nil)
        self.user.addObserver(self, forKeyPath: "ks2", options: NSKeyValueObservingOptions.Initial, context: nil)
        self.user.addObserver(self, forKeyPath: "ks3", options: NSKeyValueObservingOptions.Initial, context: nil)
        self.user.addObserver(self, forKeyPath: "ks4", options: NSKeyValueObservingOptions.Initial, context: nil)
        self.user.addObserver(self, forKeyPath: "ks5a", options: NSKeyValueObservingOptions.Initial, context: nil)
        self.user.addObserver(self, forKeyPath: "ks5b", options: NSKeyValueObservingOptions.Initial, context: nil)
        self.user.addObserver(self, forKeyPath: "ks6", options: NSKeyValueObservingOptions.Initial, context: nil)
    }
    
    func setSwitch()
    {
        ks1Switch.on = user.ks1
        ks2Switch.on = user.ks2
        ks3Switch.on = user.ks3
        ks4Switch.on = user.ks4
        ks5aSwitch.on = user.ks5a
        ks5bSwitch.on = user.ks5b
        ks6Switch.on = user.ks6
    }
    
    override func observeValueForKeyPath(keyPath: String!, ofObject object: AnyObject!, change: [NSObject : AnyObject]!, context: UnsafeMutablePointer<()>)
    {
        if user.ks1 != nil && user.ks2 != nil && user.ks3 != nil && user.ks4 != nil && user.ks5a != nil && user.ks5b != nil && user.ks6 != nil
        {
            setSwitch()
        }
    }

    func didReceivedUserVO(userVO: UserVO)
    {
        user.dataFromVO(userVO)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    func askForNotification()
    {
        var types: UIUserNotificationType = UIUserNotificationType.Badge |
            UIUserNotificationType.Alert |
            UIUserNotificationType.Sound
        
        var settings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: nil)
        
        let application = UIApplication.sharedApplication()
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
    }
}