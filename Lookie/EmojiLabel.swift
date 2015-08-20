//
//  EmojiLabel.swift
//  Lookie!
//
//  Created by PATRICK PERINI on 8/20/15.
//  Copyright (c) 2015 AppCookbook. All rights reserved.
//

import UIKit

@IBDesignable class EmojiLabel: UILabel {
    // MARK: Properties
    @IBInspectable var borderWidth: CGFloat {
        get { return self.layer.borderWidth }
        set { self.layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get { return UIColor(CGColor: self.layer.borderColor) }
        set { self.layer.borderColor = newValue?.CGColor }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.layer.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
}
