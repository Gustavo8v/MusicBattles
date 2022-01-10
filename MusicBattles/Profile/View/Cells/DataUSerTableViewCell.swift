//
//  DataUSerTableViewCell.swift
//  MusicBattles
//
//  Created by Gustavo on 08/01/22.
//
protocol DataUSerTableViewCellDelegate: AnyObject {
    func closeSession()
}

import UIKit

class DataUSerTableViewCell: UITableViewCell {
    
    static let identifier = "DataUSerTableViewCell"
    weak var delegate: DataUSerTableViewCellDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emialLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var closeSession: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        closeSession.setShadowButton()
        closeSession.cornerRadius(corner: 16)
    }
    
    func prepareData(data: RegisterUser){
        nameLabel.text = data.name
        lastNameLabel.text = data.lastName
        emialLabel.text = data.email
        ageLabel.text = data.age.description
    }
    
    @IBAction func onClickcloseSession(_ sender: Any) {
        delegate?.closeSession()
    }
}
