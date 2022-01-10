//
//  RegisterUserPresenter.swift
//  MusicBattles
//
//  Created by Gustavo on 09/01/22.
//

import Foundation
import RealmSwift
import KeychainSwift

class RegisterUserPresenter {
    
    let keychain = KeychainSwift()
    let realm = try! Realm()
    var registerUser: RegisterUser?
    var users = try! Realm().objects(RegisterUser.self)
    
    func registerUser(name: String, lastName: String, age: Int, email: String) -> Bool {
        var validate = true
        for user in users {
            if user.email == email {
                validate = false
                return false
            }
        }
        try! realm.write{
            let newUser = RegisterUser()
            newUser.name = name
            newUser.lastName = lastName
            newUser.age = age
            newUser.email = email
            realm.add(newUser)
            registerUser = newUser
        }
        return validate
    }
    
    func savePassword(email: String, password: String){
        keychain.set(password, forKey: email)
    }
}
