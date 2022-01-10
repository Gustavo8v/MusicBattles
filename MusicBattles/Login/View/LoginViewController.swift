//
//  LoginViewController.swift
//  MusicBattles
//
//  Created by Gustavo on 09/01/22.
//

import UIKit
import Material

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginConstrain: NSLayoutConstraint!
    
    var presenter = PresenterLogin()
    var DataUser = RegisterUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        loginButton.cornerRadius(corner: 16)
        emailTextField.setColor()
        passwordTextField.setColor()
        passwordTextField.isHidden = true
        loginConstrain.constant = -50
        getDelegateTextFields(textFields: [emailTextField, passwordTextField])
    }
    
    func prepareData(){
        
    }
    
    @IBAction func onClickLoginUser(_ sender: Any) {
        guard let safeEmail = emailTextField.text else {
                  return
              }
        if loginButton.titleLabel?.text == "Validar email" {
            if presenter.validateEmailLogin(email: safeEmail) {
                loginButton.setTitle("Iniciar sesión", for: .normal)
                passwordTextField.isHidden = false
                loginConstrain.constant = 40
            } else {
                showAlert(title: "Correo inválido", description: "Este correo no está registrado, por favor registralo en una cuenta")
            }
        }
        
        if loginButton.titleLabel?.text == "Iniciar sesión" {
            guard let safePassword = passwordTextField.text else {
                      return
                  }
            if presenter.validatePassword(password: safePassword) {
                passwordTextField.isHidden = true
                loginConstrain.constant = -50
                passwordTextField.text = nil
                loginButton.setTitle("Validar email", for: .normal)
                let vc = ProfileViewController()
                vc.chargeData(data: presenter.userLogin)
                vc.modalPresentationStyle = .overFullScreen
                present(vc, animated: true, completion: nil)
            } else {
                self.showAlert(title: "¡Ups!", description: "Parece que la contraseña que ingresaste es incorrecta")
            }
        }
    }
    
    @IBAction func onClickRegisterUser(_ sender: Any) {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
