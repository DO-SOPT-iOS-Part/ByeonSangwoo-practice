//
//  ViewController.swift
//  ByeonSangwoo-practice-Week2
//
//  Created by 변상우 on 10/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    var yellowView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .yellow
        
        return view
    }()
    
    var greenView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .green
        
        return view
    }()
    
    var blackView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        
        return view
    }()
    
    var blueView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .blue
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setLayout()
    }
    
    private func setLayout() {
        [yellowView, greenView, blackView, blueView].forEach { [weak self] view in
            guard let self else { return }
            
            view.translatesAutoresizingMaskIntoConstraints = false
            
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            yellowView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            yellowView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
            yellowView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4),
            
            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 0),
            greenView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 0),
            greenView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
            greenView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4),
            
            blackView.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 0),
            blackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            blackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
            blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4),
            
            blueView.topAnchor.constraint(equalTo: blackView.bottomAnchor, constant: 0),
            blueView.leadingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: 0),
            blueView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
            blueView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4),
        ])
    }
}

