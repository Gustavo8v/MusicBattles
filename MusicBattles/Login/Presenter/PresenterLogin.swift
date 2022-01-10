//
//  PresenterLogin.swift
//  MusicBattles
//
//  Created by Gustavo on 09/01/22.
//

import Foundation
import KeychainSwift
import RealmSwift

class PresenterLogin {
    
    let realm = try! Realm()
    var registeredUsers = try! Realm().objects(RegisterUser.self)
    let keychain = KeychainSwift()
    var userLogin = RegisterUser()
    
    func validateEmailLogin(email: String) -> Bool {
        var validate = false
        for user in registeredUsers {
            validate = user.email == email ? true : false
            if validate {
                userLogin = user
                return validate
            }
        }
        return validate
    }
    
    func validatePassword(password: String) -> Bool {
        var validate = false
        if password == keychain.get(userLogin.email) {
            validate = true
        }
        return validate
    }
}
