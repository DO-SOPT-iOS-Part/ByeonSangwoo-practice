//
//  ResultViewController.swift
//  ByeonSangwoo-practice
//
//  Created by 변상우 on 10/7/23.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var turtleLabel: UILabel!
    
    var loginDataCompletion: (([String]) -> Void)?
    
    var delegate: GetDataProtocol?
    
    var email: String = ""
    var password: String = ""
    var turtleLike: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindText()
    }
    
    private func bindText() {
        self.emailLabel.text = "Email : \(email)"
        self.passwordLabel.text = "Password : \(password)"
        self.turtleLabel.text = "당신은 거북이를 \(turtleLike)만큼 좋아하시는 군요!!"
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        
        if self.navigationController != nil {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
        
        delegate?.getLoginData(email: email, password: password)
        
        guard let loginDataCompletion else { return }
        
        loginDataCompletion([email, password])
    }
}
