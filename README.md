# IJCardsView

[![CI Status](http://img.shields.io/travis/imranjutt/IJCardsView.svg?style=flat)](https://travis-ci.org/imranjutt/IJCardsView)
[![Version](https://img.shields.io/cocoapods/v/IJCardsView.svg?style=flat)](http://cocoapods.org/pods/IJCardsView)
[![License](https://img.shields.io/cocoapods/l/IJCardsView.svg?style=flat)](http://cocoapods.org/pods/IJCardsView)
[![Platform](https://img.shields.io/cocoapods/p/IJCardsView.svg?style=flat)](http://cocoapods.org/pods/IJCardsView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

IJCardsView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'IJCardsView', '~> 0.1.0'
```

## Carthage

You can also add the framework via carthage simply add the following line in your Cartfile

```ruby
github "imranjutt/IJCardsView" ~> 0.1.1
```

## Usage

Usage is incredibly easy all you need to do is call

```ruby
var cardsViewFrame = CGRect()
cardsViewFrame.size.width = UIScreen.main.bounds.size.width
cardsViewFrame.size.height = UIScreen.main.bounds.size.width * 0.625
cardsViewFrame.origin.x = 0;
cardsViewFrame.origin.y = 20;

let cardsView: IJCardsView = IJCardsView(frame: cardsViewFrame, numberOfCards: 10, cardImageName: "bank_card_soneri", cardPositionUpdatedBlock: { (selectedCardIndex) in
//handle callback here
print(selectedCardIndex)
})

self.view.addSubview(cardsView)

```

## Author

imranjutt, muhammad.imran.jutt@venturedive.com

## License

IJCardsView is available under the MIT license. See the LICENSE file for more info.
