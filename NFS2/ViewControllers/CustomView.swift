//
//  CustomView.swift
//  NFS2
//
//  Created by mac on 23.11.2023.
//

import UIKit

final class CustomView: UIView {
    
    var backgroundImage: UIImage?
    
    let startGameButton = CustomButton(color: .blue, title: "START GAME", cornerRadius: 12)
    let settingsButton = CustomButton(title: "SETTINGS")
    let recordsButton = CustomButton(title: "RECORDS")
    
    var actionStartGameButton: (() -> ())?
    var actionSettingsButton: (() -> ())?
    var actionRecordButton: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundImage = UIImage(named: "mainImage")
        let backgroundImageView = UIImageView(image: backgroundImage)
        
        backgroundImageView.frame = self.bounds
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        self.addSubview(backgroundImageView)
        self.sendSubviewToBack(backgroundImageView)
        
        self.addSubview(startGameButton)
        self.addSubview(settingsButton)
        self.addSubview(recordsButton)
        
        startGameButton.frame = CGRect(x: 50, y: 500, width: 300, height: 50)
        settingsButton.frame = CGRect(x: 50, y: 570, width: 300, height: 50)
        recordsButton.frame = CGRect(x: 50, y: 640, width: 300, height: 50)
      
        startGameButton.addTarget(self, action: #selector(actionStartGameButtonTapped), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(actionSettingsGameButtonTapped), for: .touchUpInside)
        recordsButton.addTarget(self, action: #selector(actionRecordsGameButtonTapped), for: .touchUpInside)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private  func actionStartGameButtonTapped() {
        actionStartGameButton?()
    }
    
    @objc
    private  func actionSettingsGameButtonTapped() {
        actionSettingsButton?()
}
    
    @objc
        private  func actionRecordsGameButtonTapped() {
            actionRecordButton?()
    }
}
