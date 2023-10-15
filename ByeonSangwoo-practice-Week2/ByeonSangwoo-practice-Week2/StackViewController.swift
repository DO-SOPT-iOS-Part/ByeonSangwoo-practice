//
//  StackViewController.swift
//  ByeonSangwoo-practice-Week2
//
//  Created by 변상우 on 10/14/23.
//

import UIKit

class StackViewController: UIViewController {
    
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        [stackView1, stackView2].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                $0.heightAnchor.constraint(equalToConstant: 1500)
            ])
            
            contentView.addSubview($0)
        }
        
        [yellowView, blackView].forEach {
            view.translatesAutoresizingMaskIntoConstraints = false
            
            stackView1.addArrangedSubview($0)
            
            let whiteView: UIView = {
                let view = UIView()
                view.backgroundColor = .white
                return view
            }()
            
            stackView1.addArrangedSubview(whiteView)
            
        }
        
        [greenView, blueView].forEach {
            view.translatesAutoresizingMaskIntoConstraints = false
            
            let whiteView: UIView = {
                let view = UIView()
                view.backgroundColor = .white
                return view
            }()
            
            stackView2.addArrangedSubview(whiteView)
            
            stackView2.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView1.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
            
            stackView2.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
        ])
    }
}
