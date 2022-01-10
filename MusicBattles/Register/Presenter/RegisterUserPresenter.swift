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
    
    func registerUser(name: String, lastName: String, age: Int, email: String){
        try! realm.write{
            let newUser = RegisterUser()
            newUser.name = name
            newUser.lastName = lastName
            newUser.age = age
            newUser.email = email
            realm.add(newUser)
            registerUser = newUser
        }
    }
    
    func savePassword(email: String, password: String){
        keychain.set(password, forKey: email)
    }
}
