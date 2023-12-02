//
//  GestureViewController.swift
//  ByeonSangwoo-practice-4th-Seminar
//
//  Created by 변상우 on 11/25/23.
//

import UIKit

import SnapKit
import Then

class GestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
    }
    
    
    @objc private func didImageViewMoved(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: imageView)
        let changedX = imageView.center.x + transition.x
        let changedY = imageView.center.y + transition.y
        self.imageView.center = .init(x: changedX,
                                     y: changedY)
        sender.setTranslation(.zero, in: imageView)
    }
    
    
    private lazy var imageView = UIImageView(image: UIImage(named: "turtle")).then {
        let gesture = UIPanGestureRecognizer(target: self,
                                             action: #selector(didImageViewMoved(_:)))
        $0.addGestureRecognizer(gesture)
        $0.isUserInteractionEnabled = true
    }
}
