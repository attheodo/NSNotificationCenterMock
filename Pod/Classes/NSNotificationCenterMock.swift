//
//  NSNotificationCenterMock.swift
//  NSNotificationCenterMockExample
//
//  Created by Athanasios Theodoridis on 03/01/16.
//  Copyright © 2016 Athanasios Theodoridis. All rights reserved.
//

import Foundation

struct NotificationItem: Equatable, Hashable {
    
    var name: String
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

public class NSNotificationCenterMock: NSNotificationCenter {
    
    /// Array holding all registered notification names along with their selectors
    private var registeredObservers:[NotificationItem] = []
    
    /// Array holding posted notifications along with how many times they were posted
    var postedNotifications:[String] = []
    
    // MARK: - Method Overrides
    override public func addObserver(observer: AnyObject, selector aSelector: Selector, name aName: String?, object anObject: AnyObject?) {
        
        if let aName = aName {
            registeredObservers.append(NotificationItem(name: aName, selector: aSelector.description))
        }
        
        super.addObserver(observer, selector: aSelector, name: aName, object: anObject)
    
    }
    
    override public func removeObserver(observer: AnyObject, name aName: String?, object anObject: AnyObject?) {
        
        if let aName = aName {
            
            for (i, notification) in registeredObservers.enumerate() {
                if notification.name == aName {
                    registeredObservers.removeAtIndex(i)
                }
            }
        }
        
        super.removeObserver(observer, name: aName, object: anObject)
    
    }
    
    override public func postNotificationName(aName: String, object anObject: AnyObject?) {
        postedNotifications.append(aName)
        super.postNotificationName(aName, object: anObject)
    }
    
    override public func postNotificationName(aName: String, object anObject: AnyObject?, userInfo aUserInfo: [NSObject : AnyObject]?) {
        postedNotifications.append(aName)
        super.postNotificationName(aName, object: anObject, userInfo: aUserInfo)
    }
    
    // MARK: - NSNotificationCenterMock API
    public func hasRegisteredNotificationName(name: String, withSelector selector: String) -> Bool {
        
        let notification = NotificationItem(name: name, selector: selector)
        
        if registeredObservers.contains(notification) {
            return true
        } else {
            return false
        }
    
    }
    
    public func hasNotificationBeenPosted(notificationName name: String) -> Bool {
       
        if postedNotifications.contains(name) {
            return true
        } else {
            return false
        }
    
    }
    
    public func timesNotificationPosted(notificationName name: String) -> Int {
        
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
