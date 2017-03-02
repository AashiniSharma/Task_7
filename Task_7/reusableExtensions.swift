//
//  reusableExtensions.swift
//  Task_7
//
//  Created by Appinventiv on 02/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var getScrollView : UIScrollView? {
    
    var subviewClass = self
    
    while !(subviewClass is UIScrollView){
    
    guard let view = subviewClass.superview else { return nil }
    
    subviewClass = view
    }
    
    return subviewClass as? UIScrollView
    
    }
    
    
    
}
