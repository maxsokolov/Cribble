#Cribble

<p align="left">
	<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/Swift_3.0-compatible-4BC51D.svg?style=flat" alt="Swift 3.0 compatible" /></a>
	<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage compatible" /></a>
	<a href="https://cocoapods.org/pods/cribble"><img src="https://img.shields.io/badge/pod-2.0.0-blue.svg" alt="CocoaPods compatible" /></a>
	<img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
	<a href="https://raw.githubusercontent.com/maxsokolov/cribble/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>

<a href="https://en.wiktionary.org/wiki/cribble">Cribble</a> - a tool for visual testing iPhone and iPad apps. Every pixel counts.

![Cribble](https://d13yacurqjgara.cloudfront.net/users/108183/screenshots/2804436/gridsystem.png)

# Getting Started

An [example app](Demo) is included demonstrating Cribble's functionality.

## Usage
Simply add the following lines into your app delegate:
```swift
import Cribble

override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
	guard motion == .motionShake else { return }

	Cribble.shared.hidden = !Cribble.shared.hidden
}
```
Shake a device and explore ui's roughness.

## Custom options
You may want to use your own parameters for the grid. In that case simply use `CribbleOptions`:
```swift
let options = CribbleOptions(horizontalStep: 10, verticalStep: 10, opacity: 0.7, color: UIColor.red)
        
Cribble.shared.options = options
```

# Installation

## CocoaPods
To integrate Cribble into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'Cribble'
```
## Carthage
Add the line `github "maxsokolov/cribble"` to your `Cartfile`.
## Manual
Clone the repo and drag files from `Sources` folder into your Xcode project.

# Requirements

- iOS 8.0
- Xcode 8.0

# Original idea

This project has been driven by product designer <a href="https://github.com/Volorf">Oleg Frolov</a>. Check out his amazing <a href="https://dribbble.com/Volorf"> Dribble</a>.

# License

Cribble is available under the MIT license. See LICENSE for details.
