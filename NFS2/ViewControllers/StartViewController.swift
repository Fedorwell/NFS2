//
//  ViewController.swift
//  NFS2
//
//  Created by mac on 22.11.2023.
//

import UIKit

class StartViewController: UIViewController {
 
    private let customView = CustomView(frame: UIScreen.main.bounds)
    
    let startGameButton = UIButton()
    
    override func loadView() {
        view = customView 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }
        func setupBinding() {
            customView.actionRecordButton = {
                print("Вперед")
                let gameVC =  GameViewController()
                self.navigationController?.pushViewController(gameVC, animated: true)
                
            }
            customView.actionSettingsButton = {
                print("Вперед")
                let gameVC =  GameViewController()
                self.navigationController?.pushViewController(gameVC, animated: true)
                
            }
            customView.actionStartGameButton = {
                print("Вперед")
                let gameVC =  GameViewController()
                self.navigationController?.pushViewController(gameVC, animated: true)
            }
        }
        
    
}

