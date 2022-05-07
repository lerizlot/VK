//
//  ViewController.swift
//  VK
//
//  Created by Lera on 27.04.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var logoImage: UIImageView!

    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func logInButton(_ sender: Any) {
    }
    
    @IBOutlet weak var orLabel: NSLayoutConstraint!
    
    @IBAction func appleSignInButton(_ sender: Any) {
    }
    @IBAction func signUpButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
}

