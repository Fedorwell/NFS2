//
//  CustomButton.swift
//  NFS2
//
//  Created by mac on 23.11.2023.
//

import UIKit
import AVFoundation

final class CustomButton: UIButton {
    
    private var buttonSoundPlayer: AVAudioPlayer?
    
    init(
        color: UIColor = .green,
        title: String = "GO!",
        cornerRadius: CGFloat = 12
    ) {
        super.init(frame: .zero)
        
        backgroundColor = color
        setTitle(title, for: .normal)
        
        self.tintColor = .green
        self.backgroundColor = .green
        self.alpha = 0.5
        self.titleLabel?.alpha = 1
        self.layer.cornerRadius = cornerRadius
        
        addTarget(self, action: #selector(playButtonSound), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    @objc private func playButtonSound() {
        buttonSoundPlayer?.play()
    }
}
