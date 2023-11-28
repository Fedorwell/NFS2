//
//  MyCarViewController.swift
//  NFS2
//
//  Created by mac on 26.11.2023.
//

import UIKit

class CarViewController: UIViewController {
    
    private var carImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем UIImageView и устанавливаем изображение автомобиля
        let carImage = UIImage(named: "MyCar1")
        carImageView = UIImageView(image: carImage)
        carImageView.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        view.addSubview(carImageView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        // Анимация движения автомобиля
        UIView.animate(withDuration: 1.0) {
            self.carImageView.center.x += 100
        }
    }
}

