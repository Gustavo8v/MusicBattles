//
//  DataUSerTableViewCell.swift
//  MusicBattles
//
//  Created by Gustavo on 08/01/22.
//

import UIKit

class DataUSerTableViewCell: UITableViewCell {
    
    static let identifier = "DataUSerTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emialLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareData(data: RegisterUser){
        nameLabel.text = data.name
        lastNameLabel.text = data.lastName
        emialLabel.text = data.email
        ageLabel.text = data.age.description
    }
}
