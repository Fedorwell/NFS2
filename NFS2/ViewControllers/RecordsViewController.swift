//
//  RecordsViewController.swift
//  NFS2
//
//  Created by mac on 24.11.2023.
//

import UIKit

class RecordsViewController: UIViewController {
    
    private let recordsCustomView = CustomViewRecordsScreen(frame: UIScreen.main.bounds)
    
    let soundController = SoundController.shared
    
    override func loadView() {
        view = recordsCustomView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = CustomBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton
        backButton.setButtonSound(filename: "clickButton_sound", withExtension: "mp3")
        
    }
    @objc func backAction() {
        if let backButton = navigationItem.leftBarButtonItem as? CustomBarButtonItem {
            backButton.playButtonSound()
        }
        navigationController?.popViewController(animated: true)
        
    }
    
}
