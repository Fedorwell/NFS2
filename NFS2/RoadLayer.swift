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
    
    //    func createRoadLayer() {
    //        let dashLength: CGFloat = 20 // Длина пунктира
    //        let spaceLength: CGFloat = 14 // Длина пробела
    //
    //        let dashPath = UIBezierPath()
    //
    //
    //        dashPath.move(to: CGPoint(x: bounds.midX, y: bounds.minY))
    //        dashPath.addLine(to: CGPoint(x: bounds.midX, y: bounds.maxY))
    //
    //        roadLayer.strokeColor = UIColor.white.cgColor
    //        roadLayer.lineWidth = 2
    //        roadLayer.lineDashPattern = [NSNumber(value: Float(dashLength)), NSNumber(value: Float(spaceLength))]
    //        roadLayer.path = dashPath.cgPath
    //
    //        layer.addSublayer(roadLayer)
    //
    //        animateRoad()
    //    }
    func createRoadLayer() {
        let dashLength: CGFloat = 30 // Длина пунктира
        let spaceLength: CGFloat = 40 // Длина пробела
        let roadWidth: CGFloat = 200 // Ширина дороги
        let shoulderWidth: CGFloat = 10 // Ширина обочины
        
        let roadCenterX = bounds.midX
        _ = bounds.midY
        let roadMinX = roadCenterX - roadWidth / 2
        let roadMaxX = roadCenterX + roadWidth / 2
        let shoulderMinX = roadMinX - shoulderWidth
        let shoulderMaxX = roadMaxX + shoulderWidth
        
        let shoulderPathLeft = UIBezierPath()
        shoulderPathLeft.move(to: CGPoint(x: shoulderMinX, y: bounds.minY))
        shoulderPathLeft.addLine(to: CGPoint(x: shoulderMinX, y: bounds.maxY))
        
        let shoulderPathRight = UIBezierPath()
        shoulderPathRight.move(to: CGPoint(x: shoulderMaxX, y: bounds.minY))
        shoulderPathRight.addLine(to: CGPoint(x: shoulderMaxX, y: bounds.maxY))
        
        let dashPath = UIBezierPath()
        dashPath.move(to: CGPoint(x: bounds.midX, y: bounds.minY))
        dashPath.addLine(to: CGPoint(x: bounds.midX, y: bounds.maxY))
        
        
        let shoulderLayerLeft = CAShapeLayer()
        shoulderLayerLeft.strokeColor = UIColor.yellow.cgColor
        shoulderLayerLeft.lineWidth = shoulderWidth
        shoulderLayerLeft.lineCap = .butt
        shoulderLayerLeft.path = shoulderPathLeft.cgPath
        
        let shoulderLayerRight = CAShapeLayer()
        shoulderLayerRight.strokeColor = UIColor.yellow.cgColor
        shoulderLayerRight.lineWidth = shoulderWidth
        shoulderLayerRight.lineCap = .butt
        shoulderLayerRight.path = shoulderPathRight.cgPath
        
        roadLayer.strokeColor = UIColor.white.cgColor
        roadLayer.lineWidth = 2
        roadLayer.lineDashPattern = [NSNumber(value: Float(dashLength)), NSNumber(value: Float(spaceLength))]
        roadLayer.path = dashPath.cgPath
        
        layer.addSublayer(shoulderLayerLeft)
        layer.addSublayer(shoulderLayerRight)
        layer.addSublayer(roadLayer)
        
        animateRoad()
    }
    
    func animateRoad() {
        let countdownValues = ["3", "2", "1", "GO!"]
        var countdownIndex = 0
        
        let countdownLabel = UILabel(frame: bounds)
        countdownLabel.textAlignment = .center
        countdownLabel.font = UIFont.systemFont(ofSize: 100)
        countdownLabel.textColor = .systemPink
        countdownLabel.alpha = 0
        addSubview(countdownLabel)
        
        // Настройка теней
        countdownLabel.layer.shadowColor = UIColor.black.cgColor
        countdownLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        countdownLabel.layer.shadowOpacity = 0.5
        countdownLabel.layer.shadowRadius = 5
        
        func animateNextCountdown() {
            countdownLabel.text = countdownValues[countdownIndex]
            countdownLabel.alpha = 1
            
            UIView.animate(withDuration: 0.7, animations: {
                countdownLabel.alpha = 0
            }) { _ in
                countdownIndex += 1
                
                if countdownIndex < countdownValues.count {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        animateNextCountdown()
                    }
                } else {
                    countdownLabel.removeFromSuperview()
                    self.startAnimation()
                }
            }
        }
        
        UIView.animate(withDuration: 0.9, delay: 0.5, animations: {
            countdownLabel.alpha = 1
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                animateNextCountdown()
            }
        }
    }
    
    func startAnimation() {
        let roadAnimation = CABasicAnimation(keyPath: "lineDashPhase")
        roadAnimation.fromValue = 0
        roadAnimation.toValue = -roadLayer.lineDashPattern!.reduce(0) { $0 + CGFloat(truncating: $1) }
        roadAnimation.duration = 0.3 // скорость анимации пунктира
        roadAnimation.repeatCount = .infinity
        
        roadLayer.add(roadAnimation, forKey: "lineDashPhaseAnimation")
    }
}
