//
//  PlayMusicViewController.swift
//  MusicBattles
//
//  Created by Gustavo on 09/01/22.
//

import UIKit
import AVFoundation

class PlayMusicViewController: BaseViewController {
    
    @IBOutlet weak var imageMusic: UIImageView!
    @IBOutlet weak var artistMusic: UILabel!
    @IBOutlet weak var nameMusic: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var dataSong: MusicDataModel?
    var presenter = PlayMusicPresenter()
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI(){
        imageMusic.image = dataSong?.image
        artistMusic.text = dataSong?.artist
        nameMusic.text = dataSong?.nameMusic
    }
    
    func chargeDataSong(data: MusicDataModel){
        dataSong = data
    }
    
    @IBAction func onClickPlayAndStopSong(_ sender: Any) {
        guard let safeArchive = dataSong?.archive else { return }
        playButton.setTitle(presenter.playSong(audio: safeArchive) ? "Pausar" : "Detener", for: .normal)
    }
}
