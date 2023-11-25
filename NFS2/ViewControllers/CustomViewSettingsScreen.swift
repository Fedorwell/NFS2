//
//  CustomViewSettings.swift
//  NFS2
//
//  Created by mac on 25.11.2023.
//
import UIKit

final class CustomViewSettingsScreen: UIView {
    
    var backgroundImage: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundImage = UIImage(named: "mainImage")
        let backgroundImageView = UIImageView(image: backgroundImage)
        
        backgroundImageView.frame = self.bounds
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
       
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
}
