//
//  CustomBarButtonItem.swift
//  NFS2
//
//  Created by Kirill Sinenchenko on 26.11.2023.
//

import UIKit
import AVFoundation

final class CustomBarButtonItem: UIBarButtonItem {
    
    private var buttonSoundPlayer: AVAudioPlayer?
    
    func setButtonSound(filename: String, withExtension ext: String) {
        guard let soundURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
            return
        }
        
        do {
            buttonSoundPlayer = try AVAudioPlayer(contentsOf: soundURL)
            buttonSoundPlayer?.prepareToPlay()
        } catch {
            print("Ошибка инициализации аудиоплеера: \(error.localizedDescription)")
        }
    }
    
    func playButtonSound() {
        buttonSoundPlayer?.play()
    }
}
