//
//  GameViewController.swift
//  NFS2
//
//  Created by mac on 23.11.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    private let gameCustomView = CustomViewGameScreen(frame: UIScreen.main.bounds)
    let soundController = SoundController.shared
    
    override func loadView() {
        view = gameCustomView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        let backButton = CustomBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton
        backButton.setButtonSound(filename: "clickButton_sound", withExtension: "mp3")
        
        let roadView = RoadView(frame: view.bounds)
        self.view.addSubview(roadView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        soundController.stopBackgroundMusic()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        soundController.startBackgroundMusic()
    }
    
    @objc func backAction() {
        // Воспроизведение звука при нажатии на кнопку "Назад"
        if let backButton = navigationItem.leftBarButtonItem as? CustomBarButtonItem {
            backButton.playButtonSound()
        }
        navigationController?.popViewController(animated: true)
    }
}
