//
//  GameViewController.swift
//  NFS2
//
//  Created by mac on 23.11.2023.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let backButton = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton
       
    }
        @objc func backAction() {
            navigationController?.popViewController(animated: true)
        
    }
    


}
