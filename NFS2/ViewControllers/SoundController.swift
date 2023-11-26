//
//  SoundController.swift
//  NFS2
//
//  Created by Kirill Sinenchenko on 25.11.2023.
//

import AVFoundation

class SoundController {
    static let shared = SoundController()
    
    private var backgroundMusicPlayer: AVAudioPlayer?
    
    private init() {}
    
    func startBackgroundMusic() {
        guard let musicURL = Bundle.main.url(forResource: "background_music", withExtension: "mp3") else {
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default, options: .mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
            
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: musicURL)
            
            backgroundMusicPlayer?.numberOfLoops = -1
            backgroundMusicPlayer?.prepareToPlay()
            backgroundMusicPlayer?.play()
        } catch {
            print("Ошибка инициализации аудиоплеера: \(error.localizedDescription)")
        }
    }
    
    func stopBackgroundMusic() {
        backgroundMusicPlayer?.stop()
        backgroundMusicPlayer = nil
    }
    
    func isBackgroundMusicPlaying() -> Bool {
        return backgroundMusicPlayer?.isPlaying ?? false
    }
    
 
}
