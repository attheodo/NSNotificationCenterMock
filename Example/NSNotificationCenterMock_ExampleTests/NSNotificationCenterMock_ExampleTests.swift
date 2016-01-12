//
//  NSNotificationCenterMockExampleTests.swift
//  NSNotificationCenterMockExampleTests
//
//  Created by Athanasios Theodoridis on 03/01/16.
//  Copyright © 2016 Athanasios Theodoridis. All rights reserved.
//
import XCTest
import Nimble
import NSNotificationCenterMock

@testable import NSNotificationCenterMock_Example

class ViewControllerTests: XCTestCase {
    
    var vc: ViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        vc = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        appDelegate.window!.rootViewController = vc
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testItProperlyRegistersNotifications() {
        
        // Inject the mock
        let NotificationCenterMock = NSNotificationCenterMock()
        vc.NotificationCenter = NotificationCenterMock
        
        // Trigger viewDidLoad
        let _ = vc.view
        
        // Test that it registered proper notifications names along with their selectors
        expect(NotificationCenterMock.hasRegisteredNotificationName("kNotificationsHello", withSelector: "updateLabelForHelloNotification:")) == true
        
        expect(NotificationCenterMock.hasRegisteredNotificationName("kNotificationsGoodbye", withSelector: "updateLabelForGoodbyeNotification:")) == true
        
        // ... or
        expect(NotificationCenterMock.hasRegisteredNotifications()) == true
        
        // ... or
        expect(NotificationCenterMock.registeredNotifications()) == 2
    
    }
    
    func testItProperlyUnregistersNotifications() {
        
        // Inject the mock
        let NotificationCenterMock = NSNotificationCenterMock()
        vc.NotificationCenter = NotificationCenterMock
        
        // Trigger viewDidLoad
        let _ = vc.view
        
        vc.unregisterNotifications()
        
        // Test that it unregistered specific notifications
        expect(NotificationCenterMock.hasRegisteredNotificationName("kNotificationsHello", withSelector: "updateLabelForHelloNotification:")) == false
        
        expect(NotificationCenterMock.hasRegisteredNotificationName("kNotificationsGoodbye", withSelector: "updateLabelForGoodbyeNotification:")) == false
        
        // ... or
        expect(NotificationCenterMock.hasRegisteredNotifications()) == false
        
        // ... or
        expect(NotificationCenterMock.registeredNotifications()) == 0
    }
    
    func testItProperlyPostsHelloNotification() {
        
        // Inject the mock
        let NotificationCenterMock = NSNotificationCenterMock()
        vc.NotificationCenter = NotificationCenterMock
        
        // Trigger viewDidLoad
        let _ = vc.view
        
        // Emulate tapping on the button
        vc.helloButton?.sendActionsForControlEvents(.TouchUpInside)
        
        expect(NotificationCenterMock.hasNotificationBeenPosted(notificationName: "kNotificationsHello")) == true
        
        // ... or
        expect(NotificationCenterMock.timesNotificationPosted(notificationName: "kNotificationsHello")) == 1

        expect(self.vc.notificationLabel?.text) == "Hello Foo"
    
    }
    
    func testItProperlyPostsGoodbyeNotification() {
        
        // Inject the mock
        let NotificationCenterMock = NSNotificationCenterMock()
        vc.NotificationCenter = NotificationCenterMock
        
        // Trigger viewDidLoad
        let _ = vc.view
        
        // Emulate tapping on the button
        vc.goodbyeButton?.sendActionsForControlEvents(.TouchUpInside)
        
        expect(NotificationCenterMock.hasNotificationBeenPosted(notificationName: "kNotificationsGoodbye")) == true
        
        expect(self.vc.notificationLabel?.text) == "Goodbye Bar"
        
    }

    
    
}
