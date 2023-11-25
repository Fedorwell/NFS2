//
//  SettingsViewController.swift
//  NFS2
//
//  Created by mac on 24.11.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let settingsCustomView = CustomViewSettingsScreen(frame: UIScreen.main.bounds)
    
    let startGameButton = UIButton()
    
    override func loadView() {
        view = settingsCustomView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
      
        
        let backButton = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton
       
    }
        @objc func backAction() {
            navigationController?.popViewController(animated: true)
        
    }
    


}
