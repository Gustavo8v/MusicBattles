//
//  PlayMusicPresenter.swift
//  MusicBattles
//
//  Created by Gustavo on 09/01/22.
//

import Foundation
import AVFoundation

class PlayMusicPresenter{
    
    var player: AVAudioPlayer?
    
    func playSong(audio: String) -> Bool{
        if let player = player, player.isPlaying {
            player.pause()
            return false
        } else {
            let urlString = Bundle.main.path(forResource: audio, ofType: "mp3")
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                guard let urlString = urlString else {
                    return false
                }
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                guard let player = player else {
                    return false
                }
                player.play()
                return true
            } catch {
                print("something went wrong")
                return false
            }
        }
    }
}
