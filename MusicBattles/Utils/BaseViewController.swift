//
//  BaseViewController.swift
//  MusicBattles
//
//  Created by Gustavo on 08/01/22.
//

import Material
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func prepareNavBar(title: String){
        navigationItem.title = title
        let apparence = UINavigationBarAppearance()
        apparence.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = apparence
        navigationController?.navigationBar.scrollEdgeAppearance = apparence
    }
    
    func checkRegisterUser(textFields: [TextField]) -> Bool {
        var validate = true
        for textField in textFields {
            if textField.text == "" || textField.text == nil {
                validate = false
                textField.errorRegister()
            }
        }
        return validate
    }
}
