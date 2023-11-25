//
//  GameViewController.swift
//  NFS2
//
//  Created by mac on 23.11.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    private let gameCustomView = CustomViewGameScreen(frame: UIScreen.main.bounds)
    
    let startGameButton = UIButton()
    
    override func loadView() {
        view = gameCustomView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        let backButton = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton
        
        let roadView = RoadView(frame: view.bounds)
        self.view.addSubview(roadView)

       
    }
        @objc func backAction() {
            navigationController?.popViewController(animated: true)
        
    }
    


}
