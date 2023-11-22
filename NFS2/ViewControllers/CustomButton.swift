//
//  CustomButton.swift
//  NFS2
//
//  Created by mac on 23.11.2023.
//

import UIKit

final class CustomButton: UIButton {
    
    init(
        color: UIColor = .green,
        title: String = "GO!",
         cornerRadius:  CGFloat = 12
    ) {
        super.init(frame: .zero)
    
        backgroundColor = color
        setTitle(title, for: .normal)
        
        self.tintColor = .green
        self.backgroundColor = .green
        self.alpha = 0.5
        self.titleLabel?.alpha = 1
        self.layer.cornerRadius = cornerRadius
        
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
