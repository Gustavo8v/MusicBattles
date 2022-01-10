//
//  ProfilePresenter.swift
//  MusicBattles
//
//  Created by Gustavo on 09/01/22.
//

import Foundation
import RealmSwift
import UIKit

class ProfilePresenter {
    
    let realmUser = try! Realm().objects(RegisterUser.self)
    let realm = try! Realm()
    var dataMusic: [MusicDataModel] = []
    
    func updateImageUser(image: Data?, email: String) {
        let userEdit = realmUser.filter("email == '\(email)'").first
        try! realm.write{
            userEdit?.imageProfile = image
        }
    }
    
    func chargeDataMusic(){
        dataMusic = [MusicDataModel(image: UIImage(named: "noEstoyRoto"),
                                    artist: "Say Ocean",
                                    nameMusic: "No Estoy Roto",
                                    archive: "noEstoyRoto"),
                     MusicDataModel(image: UIImage(named: "that´sWhatYouGet"),
                                    artist: "Paramore",
                                    nameMusic: "That´s What You Get",
                                    archive: "thatsWahtYouGet"),
                     MusicDataModel(image: UIImage(named: "frenesi"),
                                    artist: "División Minuscula",
                                    nameMusic: "Frenesí",
                                    archive: "frenesi"),
                     MusicDataModel(image: UIImage(named: "c´mere"),
                                    artist: "Interpol",
                                    nameMusic: "C'mere",
                                    archive: "c'mere"),
                     MusicDataModel(image: UIImage(named: "seguimosVivos"),
                                    artist: "Say Ocean",
                                    nameMusic: "Seguimos Vivos",
                                    archive: "seguimosVivos"),
                     MusicDataModel(image: UIImage(named: "stereoFresh"),
                                    artist: "Los Chotgun",
                                    nameMusic: "Stereo Fresh",
                                    archive: "stereoFresh"),
                     MusicDataModel(image: UIImage(named: "fatLip"),
                                    artist: "Sum 41",
                                    nameMusic: "Fat Lip",
                                    archive: "fatLip"),
                     MusicDataModel(image: UIImage(named: "nuestrasHuellas"),
                                    artist: "May Sunday",
                                    nameMusic: "Nuestras Huellas",
                                    archive: "nuestrasHuellas"),
                     MusicDataModel(image: UIImage(named: "amnesia"),
                                    artist: "Say Ocean",
                                    nameMusic: "Amnesia",
                                    archive: "amnesia"),
                     MusicDataModel(image: UIImage(named: "hardTimes"),
                                    artist: "Paramore",
                                    nameMusic: "Hard Times",
                                    archive: "hardTimes"),]
    }
}
