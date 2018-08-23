//
//  NSNotificationCenterMock.swift
//  NSNotificationCenterMockExample
//
//  Created by Athanasios Theodoridis on 03/01/16.
//  Copyright © 2016 Athanasios Theodoridis. All rights reserved.
//

import Foundation

typealias NotificationName = Notification.Name

struct NotificationItem: Equatable, Hashable {
    
    var name: NotificationName
    var selector: String
    
    var hashValue: Int {
        get {
            return "\(self.name)-\(self.selector)".hashValue
        }
    }
}

func ==(lhs: NotificationItem, rhs: NotificationItem) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

public class NSNotificationCenterMock: NotificationCenter {
    
    /// Array holding all registered notification names along with their selectors
    private var registeredObservers:[NotificationItem] = []
    
    /// Array holding posted notifications along with how many times they were posted
    var postedNotifications:[NotificationName] = []
    
    // MARK: - Method Overrides
    public override func addObserver(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?) {
        if let aName = aName {
            registeredObservers.append(NotificationItem(name: aName, selector: aSelector.description))
        }
        
        super.addObserver(observer, selector: aSelector, name: aName, object: anObject)
    }
    
    public override func removeObserver(_ observer: Any, name aName: NSNotification.Name?, object anObject: Any?) {
        if let aName = aName {
            registeredObservers = registeredObservers.filter { $0.name != aName}
        }
        
        super.removeObserver(observer, name: aName, object: anObject)
    }
    
    public override func post(name aName: NSNotification.Name, object anObject: Any?) {
        postedNotifications.append(aName)
        super.post(name: aName, object: anObject)
    }
    
    public override func post(name aName: NSNotification.Name, object anObject: Any?, userInfo aUserInfo: [AnyHashable : Any]? = nil) {
        postedNotifications.append(aName)
        super.post(name: aName, object: anObject, userInfo: aUserInfo)
    }
    
    // MARK: - NSNotificationCenterMock API
    public func hasRegisteredNotificationName(name: Notification.Name, withSelector selector: String) -> Bool {
        
        let notification = NotificationItem(name: name, selector: selector)
        
        return registeredObservers.contains(notification)
    }
    
    public func hasNotificationBeenPosted(notificationName name: Notification.Name) -> Bool {
        return postedNotifications.contains(name)
    }
    
    public func timesNotificationPosted(notificationName name: Notification.Name) -> Int {
        
        let tmp = postedNotifications.filter({ $0 == name })
        return tmp.count
        
    }
    
    public func registeredNotifications() -> Int {
        return registeredObservers.count
    }
    
    public func hasRegisteredNotifications() -> Bool {
        return registeredNotifications() > 0 ? true : false
    }
}
