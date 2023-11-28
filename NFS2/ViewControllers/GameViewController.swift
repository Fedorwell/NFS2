//
//  GameViewController.swift
//  NFS2
//
//  Created by mac on 23.11.2023.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController, UICollisionBehaviorDelegate {

    private let gameCustomView = CustomViewGameScreen(frame: UIScreen.main.bounds)
    let soundController = SoundController.shared
    let collisionBehavior = UICollisionBehavior()
    let carImageView = UIImageView()
    let animator = UIDynamicAnimator()

    override func loadView() {
        view = gameCustomView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collisionBehavior.collisionDelegate = self

        view.backgroundColor = .gray
        
        let backButton = CustomBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton
        backButton.setButtonSound(filename: "clickButton_sound", withExtension: "mp3")
        soundController.stopBackgroundMusic()
        
        let roadView = RoadView(frame: view.bounds)
        self.view.addSubview(roadView)
        
        let carImage = UIImage(named: "MyCar1")
        carImageView.image = carImage
        carImageView.frame = CGRect(x: view.bounds.midX - 50, y: view.bounds.height - 100, width: 150, height: 100)
        self.view.addSubview(carImageView)
        
        animator.addBehavior(collisionBehavior)
        
        let carPhysicsBody = UIDynamicItemBehavior(items: [carImageView])
        carPhysicsBody.allowsRotation = false
        animator.addBehavior(carPhysicsBody)
        
        let roadBounds = CGRect(x: roadView.frame.origin.x, y: roadView.frame.origin.y, width: roadView.frame.width, height: roadView.frame.height - 50)
        collisionBehavior.addBoundary(withIdentifier: "roadBoundary" as NSCopying, for: UIBezierPath(rect: roadBounds))
        
        collisionBehavior.collisionDelegate = self
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
        
              if let backButton = navigationItem.leftBarButtonItem as? CustomBarButtonItem {
                  backButton.playButtonSound()
              }
              navigationController?.popViewController(animated: true)
          }
    
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        switch gesture.state {
        case .began:
            break
        case .changed:
            let newX = carImageView.frame.origin.x + translation.x
           let newY = carImageView.frame.origin.y
            
            // Ограничить перемещение только по горизонтали
                let maxX = view.bounds.width - carImageView.frame.width // Максимальная координата X
                let newXClamped = min(max(0, newX), maxX)

            carImageView.frame.origin = CGPoint(x: newXClamped, y: newY)
            break
        case .ended, .cancelled:
            break
        default:
            break
        }
        
        gesture.setTranslation(.zero, in: view)
    }
}
