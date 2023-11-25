//
//  RoadLayer.swift
//  NFS2
//
//  Created by mac on 25.11.2023.
//

import UIKit

class RoadView: UIView {
    
    let roadLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createRoadLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createRoadLayer() {
        let dashLength: CGFloat = 20 // Длина пунктира
        let spaceLength: CGFloat = 14 // Длина пробела
        
        let dashPath = UIBezierPath()
        
        
        dashPath.move(to: CGPoint(x: bounds.midX, y: bounds.minY))
        dashPath.addLine(to: CGPoint(x: bounds.midX, y: bounds.maxY))
        
        roadLayer.strokeColor = UIColor.white.cgColor
        roadLayer.lineWidth = 2
        roadLayer.lineDashPattern = [NSNumber(value: Float(dashLength)), NSNumber(value: Float(spaceLength))]
        roadLayer.path = dashPath.cgPath
        
        layer.addSublayer(roadLayer)
        
        animateRoad()
    }
 
    func animateRoad() {
        // Создаем метку для отображения обратного отсчета
        let countdownLabel = UILabel(frame: bounds)
        countdownLabel.textAlignment = .center
        countdownLabel.font = UIFont.systemFont(ofSize: 45)
        countdownLabel.textColor = UIColor.blue
        addSubview(countdownLabel)
        
        // Обратный отсчет: 3, 2, 1, Go
        var countdownValue = 3
        let countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if countdownValue > 0 {
                countdownLabel.text = "\(countdownValue)"
            } else if countdownValue == 0 {
                countdownLabel.text = "START!"
            } else {
                timer.invalidate()
                countdownLabel.removeFromSuperview()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.startAnimation()
                }
            }
            countdownValue -= 1
        }
        
        RunLoop.current.add(countdownTimer, forMode: .common)
    }
    
    func startAnimation() {
        let roadAnimation = CABasicAnimation(keyPath: "lineDashPhase")
        roadAnimation.fromValue = 0
        roadAnimation.toValue = roadLayer.lineDashPattern?.reduce(0) { $0 + CGFloat(truncating: $1) }
        roadAnimation.duration = 0.5
        roadAnimation.repeatCount = .infinity
    

        roadLayer.add(roadAnimation, forKey: "lineDashPhaseAnimation")
    }
}
