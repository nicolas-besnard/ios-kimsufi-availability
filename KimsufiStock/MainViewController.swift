//
//  ViewController.swift
//  KimsufiStock
//
//  Created by Nicolas Besnard on 01/08/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import UIKit

class MainViewController: UIViewController
{
    @IBAction func ks1SwitchDidChange(sender: AnyObject)
    {
        println("1")
    }
    
    @IBAction func ks2SwitchDidChange(sender: AnyObject)
    {
        println("2")
    }
    
    @IBAction func ks3SwitchDidChange(sender: AnyObject)
    {
        println("3")
    }
    
    @IBAction func ks4SwitchDidChange(sender: AnyObject)
    {
        println("4")
    }
    
    @IBAction func ks5aSwitchDidChange(sender: AnyObject)
    {
        println("5a")
    }
    
    @IBAction func ks5bSwitchDidChange(sender: AnyObject)
    {
        println("5b")
    }
    
    @IBAction func ks6SwitchDidChange(sender: AnyObject)
    {
        println("6")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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