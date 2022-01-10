//
//  DataMusicCollectionViewCell.swift
//  MusicBattles
//
//  Created by Gustavo on 09/01/22.
//

import UIKit

class DataMusicCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DataMusicCollectionViewCell"
    
    @IBOutlet weak var imageMusic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareCollection(data: MusicDataModel){
        imageMusic.image = data.image
    }
}
