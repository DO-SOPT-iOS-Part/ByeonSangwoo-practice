//
//  ViewController.swift
//  ByeonSangwoo-practice
//
//  Created by 변상우 on 10/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var turtleImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var changeBackgroundColorSwitch: UISwitch!
    @IBOutlet weak var turtleSlider: UISlider!
    @IBOutlet weak var turtleSliderValue: UILabel!
    
    private var idText: String = ""
    private var passwordText: String = ""
    private var turtleLike: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    func setUp() {
        changeBackgroundColorSwitch.isOn = false
        
        turtleSliderValue.text = String(Int(turtleSlider.value))
        turtleLike = String(Int(turtleSlider.value))
    }
    
    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
        }
    }
    
    @IBAction func passwordTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
    }
    
    @IBAction func loginButtonTap(_ sender: Any) {
        pushToResultVC()
    }
    
    @IBAction func changeBackgroundColorButton(_ sender: Any) {
        if self.changeBackgroundColorSwitch.isOn == true {
            view.backgroundColor = UIColor(named: "customBlue")
        } else {
            view.backgroundColor = .systemBackground
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        
        turtleSliderValue.text = String(value)
        self.turtleLike = String(value)
        
        if sender.value > 70 {
            turtleImageView.image = UIImage(named: "smileTurtle")
        } else if sender.value < 30 {
            turtleImageView.image = UIImage(named: "sadTurtle")
        } else {
            turtleImageView.image = UIImage(named: "turtle")
        }
    }
    
    func pushToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else {return}
        resultVC.email = idText
        resultVC.password = passwordText
        
        resultVC.delegate = self
        resultVC.loginDataCompletion = { data in
           print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
       }
        
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
        
    func presentToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        resultVC.email = idText
        resultVC.password = passwordText
        self.present(resultVC, animated: true)
    }
    
//    func pushToResultVC() {
//        guard let ResultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
//        self.navigationController?.pushViewController(ResultViewController, animated: true)
//    }
    
}

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
}
