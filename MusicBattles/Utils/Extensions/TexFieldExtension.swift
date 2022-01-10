//
//  TexFieldExtension.swift
//  MusicBattles
//
//  Created by Gustavo on 09/01/22.
//

import Material

extension TextField {
    
    func setColor(){
        self.dividerActiveColor = .systemGreen
        self.placeholderActiveColor = .systemGreen
    }
    
    func errorRegister(){
        guard let safePlaceHolder = self.placeholder else { return }
        self.placeholder = "\(safePlaceHolder)"
        self.placeholderLabel.textColor = .red
        self.dividerNormalColor = .red
    }
    
    func okRegister(){
        guard let safePlaceHolder = self.placeholder else { return }
        self.placeholder = "\(safePlaceHolder)"
        self.placeholderLabel.textColor = .systemGray
        self.dividerNormalColor = .systemGray
    }
}
