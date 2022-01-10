//
//  UIButtonExtension.swift
//  MusicBattles
//
//  Created by Gustavo on 09/01/22.
//

import Foundation
import UIKit

extension UIView {
    
    func cornerRadius(corner: CGFloat){
        self.layer.cornerRadius = corner
    }
    
    func setShadowButton(){
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowColor = UIColor.lightGray.cgColor
    }
}
