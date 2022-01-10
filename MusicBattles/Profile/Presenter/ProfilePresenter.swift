//
//  ProfilePresenter.swift
//  MusicBattles
//
//  Created by Gustavo on 09/01/22.
//

import Foundation
import RealmSwift

class ProfilePresenter {
    
    let realmUser = try! Realm().objects(RegisterUser.self)
    let realm = try! Realm()
    
    func updateImageUser(image: Data?, email: String) {
        let userEdit = realmUser.filter("email == '\(email)'").first
        try! realm.write{
            userEdit?.imageProfile = image
        }
    }
}
