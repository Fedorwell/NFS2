//
//  RecordsViewController.swift
//  NFS2
//
//  Created by mac on 24.11.2023.
//

import UIKit

class RecordsViewController: UIViewController {
    
    private let recordsCustomView = CustomViewRecordsScreen(frame: UIScreen.main.bounds)
    

    override func loadView() {
        view = recordsCustomView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let backButton = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton
       
    }
        @objc func backAction() {
            navigationController?.popViewController(animated: true)
        
    }
    


}
