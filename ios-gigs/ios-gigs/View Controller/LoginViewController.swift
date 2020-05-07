//
//  LoginViewController.swift
//  ios-gigs
//
//  Created by Iyin Raphael on 5/6/20.
//  Copyright © 2020 Iyin Raphael. All rights reserved.
//

import UIKit

enum LoginType {
    case signUp
    case signIn
}

class LoginViewController: UIViewController {

    var segmentControl: UISegmentedControl!
    var userNameTextField: UITextField!
    var passwordTextfield: UITextField!
    var loginButton: UIButton!
    
    var gigController: GigController?
    var  loginType = LoginType.signUp
    
    override func loadView() {
        super.loadView()
    
        
        view.backgroundColor = .white
        view.isOpaque = true
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints  = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        view.addSubview(stackView)
        
        segmentControl = UISegmentedControl(items: ["Sign Up", "Sign In"])
        segmentControl.addTarget(self, action: #selector(changeButton), for: .touchUpInside)
        stackView.addArrangedSubview(segmentControl)
        
        userNameTextField = UITextField()
        userNameTextField.placeholder = "Username"
        stackView.addArrangedSubview(userNameTextField)
        
        passwordTextfield = UITextField()
        passwordTextfield.placeholder = "Password"
        passwordTextfield.textContentType = .password
        passwordTextfield.isSecureTextEntry = true
        stackView.addArrangedSubview(passwordTextfield)
        
        loginButton = UIButton(type: .roundedRect)
        loginButton.addTarget(self, action: #selector(signUpButton), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.backgroundColor = .cyan
        stackView.addArrangedSubview(loginButton)
        

        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30.0),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10.0),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10.0),
            
            loginButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 15.0),
            loginButton.heightAnchor.constraint(equalToConstant: 44.0)
            
        ])
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        passwordTextfield.textContentType = .password

    }
    
    @objc func changeButton() {
        if segmentControl.selectedSegmentIndex == 0 {
            loginType = .signUp
            loginButton.setTitle("Sign Up", for: .normal)
        } else {
            loginType = .signIn
            loginButton.setTitle("Sign In", for: .normal)
        }
    }
    
     @objc func signUpButton() {
        
        if let userName = userNameTextField.text, !userName.isEmpty,
            let password = passwordTextfield.text, !password.isEmpty {
            let user = User(username: userName, password: password)
            
            if loginType == .signUp {
                gigController?.signUp(with: user, completion: { response in
                    
                    if let success = try? response.get() {
                        if success {
                            DispatchQueue.main.async {
                                let alertController = UIAlertController(title: "Success", message: "Sign up successful!", preferredStyle: .alert)
                                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                alertController.addAction(alertAction)
                                self.present(alertController, animated: true) {
                                    self.loginType = .signIn
                                    self.segmentControl.selectedSegmentIndex = 1
                                    self.loginButton.setTitle("Sign In", for: .normal)
                                }
                            }
                        } else {
                            print("Error signing up: \(NSError())")
                        }
                    }
                })
            }
        
        }
        
    }
    
}

