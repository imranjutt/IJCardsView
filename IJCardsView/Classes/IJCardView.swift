//
//  IJCardView.swift
//  ObjectiveProjs
//
//  Created by M Imran on 07/07/2017.
//  Copyright © 2017 M Imran. All rights reserved.
//

import UIKit

class IJCardView: UIView {

    @IBOutlet weak var cardImageView: UIImageView!
    
    func setCardImageWithName(_ name:String) {
        self.cardImageView.image = UIImage(named: name)
    }
    
    static func loadFromXib() -> UIView {
        
        return Bundle(for: IJCardView.self).loadNibNamed(String(describing: IJCardView.self), owner: nil, options: nil)?.first as! IJCardView
    }
    
}
