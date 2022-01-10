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
    
    private enum ValidateTextField: String {
        case age = "Edad *"
        case email =  "Email *"
        case password = "Contraseña *"
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
            } else {
                textField.okRegister()
            }
        }
        if validate == true {
            for validateTextField in textFields {
                let switchTextFields = ValidateTextField(rawValue: validateTextField.placeholder ?? "")
                switch switchTextFields {
                case .age:
                    if validateTextField.text!.count < 2 {
                        validate = false
                        validateTextField.errorRegister()
                        showAlert(title: "Error en edad", description: "Por favor introduce una edad válida")
                        return false
                    }
                case .email:
                    if !validateTextField.text!.isValida(.email) {
                        validate = false
                        validateTextField.errorRegister()
                        showAlert(title: "Error en email", description: "Por favor introduce un email válido")
                        return false
                    }
                case .password:
                    if validateTextField.text!.count < 8 {
                        validate = false
                        validateTextField.errorRegister()
                        showAlert(title: "Error en contraseña", description: "Por favor introduce una contraseña de mínimo 8 carácteres")
                        return false
                    }
                case .none:
                    break
                }
            }
        }
        return validate
    }
    
    func showAlert(title: String, description: String){
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "Continuar", style: .cancel)
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
    }
    
    func getDelegateTextFields(textFields: [TextField]) {
        for textField in textFields {
            textField.delegate = self
        }
    }
}

extension BaseViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
