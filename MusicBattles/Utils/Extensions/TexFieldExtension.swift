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
        self.placeholder = "Llenar \(safePlaceHolder)"
        self.placeholderLabel.textColor = .red
        self.dividerNormalColor = .red
    }
}
