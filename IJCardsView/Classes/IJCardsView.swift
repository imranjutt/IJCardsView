//
//  IJCardsView.swift
//  ObjectiveProjs
//
//  Created by M Imran on 07/07/2017.
//  Copyright © 2017 M Imran. All rights reserved.
//

import UIKit

public class IJCardsView: UIView {
    
    
    //MARK: properties
    private let kScrollViewMargin = CGFloat(30.0)
    private let kCardInnerMargin = CGFloat(20.0)
    private let kScaleFactor = CGFloat(1.2)
    private let kHeaderMenuHeight = CGFloat(0.0)
    private let kButtonsSpacing = CGFloat(20.0)
    private let kButtonsWidth = CGFloat(80)
    private let kButtonsHeight = CGFloat(50)
    
    
    private var isFirstPass: Bool = false
    
    private var callBack: ((_ selectedIndex: Int) -> Void)?
    
    private let numberOfCards: Int
    private let cardImageName: String
    private var cardsView = [UIView]()
    private var scrollView: UIScrollView?
    private var selectedCardIndex: Int
    
    
    //MARK: Initializer
  public  init(frame: CGRect,numberOfCards:Int, cardImageName:String, cardPositionUpdatedBlock:@escaping ((Int)->Void)) {
        
        self.numberOfCards  = numberOfCards
        self.selectedCardIndex = 0
        self.cardImageName = cardImageName
        self.callBack = cardPositionUpdatedBlock
        super.init(frame: frame)
        self.setupVeiws()
        
    }
    
    
    //MARK: private methods

    private func setupVeiws() {
        
        var scrollViewFrame:CGRect = CGRect()
        
        scrollViewFrame.origin.x = kScrollViewMargin
        scrollViewFrame.origin.y = kHeaderMenuHeight
        scrollViewFrame.size.height = self.frame.size.height - kHeaderMenuHeight
        scrollViewFrame.size.width = self.frame.size.width - (kScrollViewMargin * 2)
        
        self.scrollView = UIScrollView(frame: scrollViewFrame)
        
        for i in 0...numberOfCards {
            
            let contentViewFrame = CGRect(x: scrollViewFrame.size.width * CGFloat(i), y: 0, width: scrollViewFrame.size.width, height: scrollViewFrame.size.height)
            let contentView: UIView = UIView(frame: contentViewFrame)
            
            var cardFrame:CGRect = CGRect()
            cardFrame.size.width = contentView.frame.size.width - (kCardInnerMargin * 2)
            cardFrame.size.height = cardFrame.size.width * 0.5714;
            cardFrame.origin.y = (contentView.frame.size.height - cardFrame.size.height)/2;
            cardFrame.origin.x = (contentView.frame.size.width - cardFrame.size.width)/2;
            
            
            let cardView = IJCardView.loadFromXib() as! IJCardView
            
            cardView.frame = cardFrame
            cardView.tag = i
            cardView.setCardImageWithName(cardImageName)
            contentView.addSubview(cardView)
            contentView.tag = i
            
            cardsView.append(cardView)
            scrollView?.addSubview(contentView)
            
        }
    
        self.scrollView?.isScrollEnabled = false;
        self.scrollView?.isPagingEnabled = true;
        self.scrollView?.clipsToBounds = false;
        self.scrollView?.showsHorizontalScrollIndicator = false;
        
        let scrollViewContentSize = CGSize(width: scrollViewFrame.size.width * CGFloat(numberOfCards) , height: scrollViewFrame.size.width)
        self.scrollView?.contentSize = scrollViewContentSize
        
        self.addSubview(self.scrollView!)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action:#selector(self.leftGestureDetected))
        swipeLeft.direction = .left
        scrollView?.addGestureRecognizer(swipeLeft)
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action:#selector(self.rightGestureDetected))
        swipeRight.direction = .right
        scrollView?.addGestureRecognizer(swipeRight)
        
        
    }
    
    
    override public func layoutSubviews() {
        if !isFirstPass {
            
            isFirstPass = true
            selectedCardIndex = 0
            self.scaleUpView(self.cardsView[selectedCardIndex])
            
        }
    }
    
    
    
   @objc private func leftGestureDetected() {
        
        if !(self.cardsView.count == (selectedCardIndex + 1)) {
            
            let previousView = cardsView[selectedCardIndex]
            self.scaleDownView(previousView)
            let currentcardView = cardsView[selectedCardIndex + 1]
            self.moveToNextCard(currentcardView)
        }
    }
  
    
  @objc private func rightGestureDetected() {
        
        if selectedCardIndex != 0 {
            
            let previousView = cardsView[selectedCardIndex]
            self.scaleDownView(previousView)
            let currentView = cardsView[selectedCardIndex - 1]
            self.moveToNextCard(currentView)
        }
    }
    
    
    private func moveToNextCard(_ view:UIView) {
        self.scaleUpView(view)
        selectedCardIndex = view.tag
        self.setScrollViewContentOffsetWithIndex(selectedCardIndex)
    }
    
    
    private func scaleDownView(_ view:UIView) {
        UIView.animate(withDuration: 0.3) {
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    
    private func scaleUpView(_ view:UIView) {
        UIView.animate(withDuration: 0.3) { 
            view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
        
    }
    
    private func setScrollViewContentOffsetWithIndex(_ index:Int) {
        let contentOffSet = CGPoint(x: ((scrollView?.bounds.size.width)! * CGFloat(index)), y: 0)
        scrollView?.setContentOffset(contentOffSet, animated: true)
        self.callBack!(index)
    }
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
