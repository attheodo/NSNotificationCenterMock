//
//  ViewController.swift
//  NSNotificationCenterMock
//
//  Created by Athanasios Theodoridis on 03/01/16.
//  Copyright © 2016 Athanasios Theodoridis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let kNotificationsHello = "kNotificationsHello"
    let kNotificationsGoodbye = "kNotificationsGoodbye"
    
    // MARK: - IBOutlets
    @IBOutlet weak var helloButton: UIButton?
    @IBOutlet weak var goodbyeButton: UIButton?
    @IBOutlet weak var notificationLabel: UILabel?
    
    // MARK: - IBActions
    @IBAction func postHelloNotification() {
        NotificationCenter.postNotificationName(kNotificationsHello, object: "Foo", userInfo: nil)
    }
    
    @IBAction func postGoodbyeNotification() {
        NotificationCenter.postNotificationName(kNotificationsGoodbye, object: "Bar", userInfo: nil)
    }
    
    // MARK: - Controller Properties
    lazy var NotificationCenter = {
        return NSNotificationCenter.defaultCenter()
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotifications()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        unregisterNotifications()
    }
    
    // MARK: - NSNotifications
    func registerNotifications() {
        NotificationCenter.addObserver(self, selector: "updateLabelForHelloNotification:", name: kNotificationsHello, object: nil)
        NotificationCenter.addObserver(self, selector: "updateLabelForGoodbyeNotification:", name: kNotificationsGoodbye, object: nil)
    }
    
    func unregisterNotifications() {
        NotificationCenter.removeObserver(self, name: kNotificationsHello, object: nil)
        NotificationCenter.removeObserver(self, name: kNotificationsGoodbye, object: nil)
    }
    
    // MARK: NSNotification Selectors
    internal func updateLabelForHelloNotification(notification: NSNotification) {
        
        if let name = notification.object as? String {
            notificationLabel?.text = "Hello \(name)"
        }
        
    }
    
    internal func updateLabelForGoodbyeNotification(notification: NSNotification) {
        
        if let name = notification.object as? String {
            notificationLabel?.text = "Goodbye \(name)"
        }
    
    }


}

