//
//  ViewController.swift
//  NFS2
//
//  Created by mac on 22.11.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    private let customView = CustomViewStartScreen(frame: UIScreen.main.bounds)
    let soundController = SoundController.shared
    
    let startGameButton = UIButton()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !soundController.isBackgroundMusicPlaying() {
            soundController.startBackgroundMusic()
        }
    }
    
    func setupBinding() {
        customView.actionStartGameButton = {
            print("Вперед")
            let gameVC =  GameViewController()
            self.navigationController?.pushViewController(gameVC, animated: true)
        }
        
        customView.actionSettingsButton = {
            print("Вперед")
            let settinsGameVC =  SettingsViewController()
            self.navigationController?.pushViewController(settinsGameVC, animated: true)
        }
        
        customView.actionRecordButton = {
            print("Вперед")
            let recordsGameVC = RecordsViewController()
            self.navigationController?.pushViewController(recordsGameVC, animated: true)
        }
    }
}

