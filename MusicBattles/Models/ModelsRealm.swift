//
//  ModelsRealm.swift
//  MusicBattles
//
//  Created by Gustavo on 08/01/22.
//

import Foundation
import RealmSwift
import UIKit

class RegisterUser: Object {
    @objc dynamic var name = ""
    @objc dynamic var lastName = ""
    @objc dynamic var age = 0
    @objc dynamic var email = ""
    @objc dynamic var imageProfile: Data?
}

struct MusicDataModel{
    var image: UIImage?
    var artist: String?
    var nameMusic: String?
    var archive: String?
}
