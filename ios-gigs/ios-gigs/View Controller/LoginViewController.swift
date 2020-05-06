//
//  LoginViewController.swift
//  ios-gigs
//
//  Created by Iyin Raphael on 5/6/20.
//  Copyright © 2020 Iyin Raphael. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var segmentControl: UISegmentedControl!
    var userNameTextField: UITextField!
    var passwordTextfield: UITextField!
    var loginButton: UIButton!
    
    override func loadView() {
        super.loadView()
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints  = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        view.addSubview(stackView)
        
        segmentControl = UISegmentedControl(items: ["Sign Up", "Sign In"])
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(segmentControl)
        
        userNameTextField = UITextField()
        userNameTextField.placeholder = "Username"
        stackView.addArrangedSubview(userNameTextField)
        
        passwordTextfield = UITextField()
        passwordTextfield.placeholder = "Password"
        stackView.addArrangedSubview(passwordTextfield)
        
        loginButton = UIButton(type: .roundedRect)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.backgroundColor = .blue
        stackView.addArrangedSubview(loginButton)
        

        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30.0),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10.0),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 10.0),
            
            loginButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 15.0),
            loginButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 15.0),
            loginButton.heightAnchor.constraint(equalToConstant: 44.0)
            
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

