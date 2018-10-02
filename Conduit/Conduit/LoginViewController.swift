//
//  LoginViewController.swift
//  Conduit
//
//  Created by Lucas Coiado Mota on 02/10/18.
//  Copyright © 2018 Amadeu Cavalcante Filho. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let loginLabel = UILabel()
    let usernameTextField = UITextField()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let sendButton = UIButton()
    let signinButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupLayout()
        setupConstraints()
        
        
        // Do any additional setup after loading the view.
    }
    
    func setupLayout() {
        self.view.addSubview(loginLabel)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(sendButton)
        self.view.addSubview(signinButton)
        
        loginLabel.text = "Login"
        loginLabel.translatesAutoresizingMaskIntoConstraints=false
        loginLabel.font = UIFont(name: "Arial", size: 30 )
        loginLabel.textAlignment = .center
        usernameTextField.placeholder = "Username"
        usernameTextField.font = UIFont(name: "Arial", size: 24 )
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email"
        emailTextField.font = UIFont(name: "Arial", size: 24 )
        emailTextField.translatesAutoresizingMaskIntoConstraints=false
        passwordTextField.placeholder = "Password"
        passwordTextField.font = UIFont(name: "Arial", size: 24 )
        passwordTextField.translatesAutoresizingMaskIntoConstraints=false
        sendButton.setTitle("Login", for: .normal)
        sendButton.titleLabel?.font = UIFont(name: "Arial", size: 24 )
        sendButton.backgroundColor = .black
        sendButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        sendButton.translatesAutoresizingMaskIntoConstraints=false
        signinButton.setTitle("Sigin", for: .normal)
        signinButton.titleLabel?.font = UIFont(name: "Arial", size: 24 )
        signinButton.backgroundColor = .black
        signinButton.addTarget(self, action: #selector(signinUser), for: .touchUpInside)
        signinButton.translatesAutoresizingMaskIntoConstraints=false
        
    }
    
    func setupConstraints() {
        
        loginLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        usernameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        sendButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        signinButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        var views : [String : UIView] = ["loginLabel": loginLabel]
        var formatStringHorizontal = "H:|-30-[loginLabel(==270)]-30-|"
        var formatStringVertical = "V:|-100-[loginLabel]"
        
        addConstraints(views: views, constraintsHorizontal: formatStringHorizontal, constraintsVertical: formatStringVertical)
        
        
        views = ["loginLabel": loginLabel, "usernameTextField": usernameTextField]
        formatStringHorizontal = "H:|-30-[usernameTextField(==270)]-30-|"
        formatStringVertical = "V:[loginLabel]-20-[usernameTextField]"
        
        addConstraints(views: views, constraintsHorizontal: formatStringHorizontal, constraintsVertical: formatStringVertical)
        
        views = ["usernameTextField": usernameTextField, "emailTextField": emailTextField]
        formatStringHorizontal = "H:|-30-[emailTextField(==270)]-30-|"
        formatStringVertical = "V:[usernameTextField]-20-[emailTextField]"
        
        addConstraints(views: views, constraintsHorizontal: formatStringHorizontal, constraintsVertical: formatStringVertical)
        
        views = ["emailTextField": emailTextField, "passwordTextField": passwordTextField]
        formatStringHorizontal = "H:|-30-[passwordTextField(==270)]-30-|"
        formatStringVertical = "V:[emailTextField]-20-[passwordTextField]"
        
        addConstraints(views: views, constraintsHorizontal: formatStringHorizontal, constraintsVertical: formatStringVertical)
        
        
        addConstraints(views: views, constraintsHorizontal: formatStringHorizontal, constraintsVertical: formatStringVertical)
        
        views = ["passwordTextField": passwordTextField, "sendButton": sendButton]
        formatStringHorizontal = "H:|-70-[sendButton]-70-|"
        formatStringVertical = "V:[passwordTextField]-60-[sendButton]"
        
        addConstraints(views: views, constraintsHorizontal: formatStringHorizontal, constraintsVertical: formatStringVertical)
        
        views = ["sendButton": sendButton, "signinButton": signinButton]
        formatStringHorizontal = "H:|-70-[signinButton]-70-|"
        formatStringVertical = "V:[sendButton]-20-[signinButton]"
        
        addConstraints(views: views, constraintsHorizontal: formatStringHorizontal, constraintsVertical: formatStringVertical)
        
        
        
        
    }
    
    func addConstraints(views:[String : UIView], constraintsHorizontal: String, constraintsVertical: String) {
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: constraintsVertical, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(
            withVisualFormat: constraintsHorizontal,
            metrics: nil,
            views: views)
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc
    func loginUser(sender: UIButton!) {
        print("Register")
    }
    
    @objc
    func signinUser(sender: UIButton!) {
        let newViewController = SigninViewController()
        self.dismiss(animated: false, completion: nil)
        self.present(newViewController, animated: false, completion: nil)
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
