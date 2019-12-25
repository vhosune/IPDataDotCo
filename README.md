#  Swift Library for IP information look up using [ipdata.co](https://ipdata.co/) API

[![Language](https://img.shields.io/badge/language-swift-orange)](https://github.com/vhosune/IPDataDotCo)
[![Platform](https://img.shields.io/cocoapods/p/IPDataDotCo)](https://github.com/vhosune/IPDataDotCo)
[![GitHub license](https://img.shields.io/github/license/vhosune/IPDataDotCo)](https://raw.githubusercontent.com/vhosune/IPDataDotCo/master/LICENSE)
[![GitHub release](https://img.shields.io/github/v/release/vhosune/IPDataDotCo?sort=semver)](https://github.com/vhosune/IPDataDotCo/releases)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/IPDataDotCo)](https://cocoapods.org/pods/IPDataDotCo)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


## Introduction

**ipdata.co** provides a free api key for upto 1500 requests daily.

Documentation of the api of [ipdata](https://docs.ipdata.co/)

`IPDataDotCo` allows you to create the `URLRequest` you  need to request the api, then you are free to include it in your network workflow.

## Requirements

- iOS 8.0+ / macOS 10.10+
- Swift 5+

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate Alamofire into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'IPDataDotCo', '~> 1.0'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate Alamofire into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "vhosune/IPDataDotCo" "~> 1.0"
```

## Usage

```
// Prepare the API to use your api key
let settings = IPDataDotCo.Settings(apiKey: "YOUR_API_KEY")

// If the api enpoint has changed (default: https://api.ipdata.co), you can use
let settings = IPDataDotCo.Settings(host: "HTTPS://NEW_ENDPOINT", apiKey: "YOUR_API_KEY")

// create a new `IPDataDotCo` with your settings
let ipdata = IPDataDotCo(with: settings)


```

```
// for a call to look up your current ip
let request = ipdata.lookupRequest()
```

```
// for a call to look up a specific ip
let request = ipdata.lookupRequest(ip: "8.8.8.8")
```

```
// for a call to look up a specific ip's country name with a link to it's flag png.
let request = ipdata.lookupRequest(ip: "8.8.8.8", for: [.countryName, .flag])
```

This call needs custom parsing of the response JSON

```
// for a call to look up a specific ip's country name
let request = ipdata.lookupRequest(ip: "8.8.8.8", for: .countryName)
```

**for paid user** 

```
// for a call to look up a bulk of ips (max 100 ip per request)
let request = ipdata.bulkLookUpRequest(ips: ["8.8.8.8", "1.1.1.1"])
```

Parsing the response be like

```
// use of `IPDataDotCo.JSONRootObject` to decode the JSON
let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

    if let http = response as? HTTPURLResponse {
        // check status error / http.statusCode
        
        // **200** successful response
        // **400** bad ip or bulk with more than 100 ips
        // **401** missing api-key
        // **403** quota exceeded or not a valid api-key

    }

    if let data = data {
        // for normal requests, but the one with only 1 field
        let object = try? JSONDecoder().decode(IPDataDotCo.JSONRootObject.self, from: data)

        // for bulk request
        let object = try? JSONDecoder().decode([IPDataDotCo.JSONRootObject].self, from: data)

        // ...

    }
}

task.resume()

```


## License

IPDataDotCo is released under the MIT license. [See LICENSE](http://www.opensource.org/licenses/mit-license.php) for details.
