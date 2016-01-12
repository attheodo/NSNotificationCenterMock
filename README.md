# NSNotificationCenterMock

[![Version](https://img.shields.io/cocoapods/v/NSNotificationCenterMock.svg?style=flat)](http://cocoapods.org/pods/NSNotificationCenterMock)
[![License](https://img.shields.io/cocoapods/l/NSNotificationCenterMock.svg?style=flat)](http://cocoapods.org/pods/NSNotificationCenterMock)
[![Platform](https://img.shields.io/cocoapods/p/NSNotificationCenterMock.svg?style=flat)](http://cocoapods.org/pods/NSNotificationCenterMock)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Then, navigate to `NSNotificationCenterMock_ExampleTests/NSNotificationCenterMock_ExampleTests.swift` and see how the test case utilises `NSNotificationCenterMock` to test the example app.

## Installation

NSNotificationCenterMock is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile for your testing targer

```ruby
target 'YourAppTests' do
    pod 'NSNotificationCenterMock'
end
```

## Documentation

`NSNotificationCenterMock` provides the following public methods:

- `hasRegisteredNotificationName(name:_, withSelector:_) -> Bool`
	- Returns whether an observer has been registered for NSNotification `name` with target selector `withSelector`.
- `hasNotificationBeenPosted(notificationName:_) -> Bool`
	- Returns whether a NSNotification named `notificationName` has been posted.
- `timesNotificationPosted(notificationName:_) -> Int`
	- Returns how many times a NSNotification named `notificationName` has been posted.
- `registeredNotifications() -> Int`
	- Returns how many notification the observer has registered too.
- `hasRegisteredNotifications() -> Bool`
	- Returns a boolean indicating whether the observer has registered to any notifications or not.


## Author

attheodo, at@atworks.gr

## License

NSNotificationCenterMock is available under the MIT license. See the LICENSE file for more info.
