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
    
    var presenter = RegisterUserPresenter()
    
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
        saveUserButton.cornerRadius(corner: 16)
        getDelegateTextFields(textFields: [nameTextField, lastNameTextField, ageTextField, emailTextField, passwordTextField])
    }
    
    @IBAction func onClickRegisterUser(_ sender: Any) {
        if checkRegisterUser(textFields: [nameTextField, lastNameTextField, ageTextField, emailTextField, passwordTextField]) {
            guard let safeName = nameTextField.text,
                  let safeLastName = lastNameTextField.text,
                  let safeAge = ageTextField.text,
                  let safeEmail = emailTextField.text,
                  let safePassword = passwordTextField.text else {
                      return
                  }
            self.presenter.registerUser(name: safeName,
                                        lastName: safeLastName,
                                        age: Int(safeAge) ?? .zero,
                                        email: safeEmail)
            self.presenter.savePassword(email: safeEmail, password: safePassword)
            navigationController?.popViewController(animated: true)
        } else {
            print("Error de registro")
        }
    }
}
