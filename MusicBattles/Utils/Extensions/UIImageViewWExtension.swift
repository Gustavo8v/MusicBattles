//
//  UIImageViewWExtension.swift
//  MusicBattles
//
//  Created by Gustavo on 09/01/22.
//

import UIKit

extension UIImageView {

    func makeRounded() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
