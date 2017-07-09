//
//  ViewController.swift
//  IJCardsView
//
//  Created by imranjutt on 07/09/2017.
//  Copyright (c) 2017 imranjutt. All rights reserved.
//

import UIKit
import IJCardsView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            // Your code with delay
            
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
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

