//
//  StackViewController.swift
//  ByeonSangwoo-practice-Week2
//
//  Created by 변상우 on 10/14/23.
//

import UIKit

class StackViewController: UIViewController {
    
    private var stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private var stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
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
    
    var whiteView1: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var whiteView2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var whiteView3: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var whiteView4: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        self.view.backgroundColor = .white
        
        [stackView1, stackView2].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            self.view.addSubview($0)
        }
        
        [yellowView, whiteView1, blackView, whiteView2].forEach {
            view.translatesAutoresizingMaskIntoConstraints = false
            
            stackView1.addArrangedSubview($0)
        }
        
        [whiteView3, greenView, whiteView4, blueView].forEach {
            view.translatesAutoresizingMaskIntoConstraints = false
            
            stackView2.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: view.topAnchor),
            stackView1.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView1.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView2.topAnchor.constraint(equalTo: view.topAnchor),
            stackView2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView2.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            stackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
