//
//  RegisterViewController.swift
//  MusicBattles
//
//  Created by Gustavo on 09/01/22.
//

import Material

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var nameTextField: TextField!
    @IBOutlet weak var lastNameTextField: TextField!
    @IBOutlet weak var ageTextField: TextField!
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var saveUserButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    func prepareUI(){
        nameTextField.setColor()
        lastNameTextField.setColor()
        ageTextField.setColor()
        emailTextField.setColor()
        passwordTextField.setColor()
        saveUserButton.layer.cornerRadius = 16
    }
    
    @IBAction func onClickRegisterUser(_ sender: Any) {
        if checkRegisterUser(textFields: [nameTextField, lastNameTextField, ageTextField, emailTextField, passwordTextField]) {
            print("todo ok")
        } else {
            print("la cagamos")
        }
    }
}
