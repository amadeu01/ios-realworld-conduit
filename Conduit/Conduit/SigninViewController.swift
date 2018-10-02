//
//  SigninViewController.swift
//  Conduit
//
//  Created by Lucas Coiado Mota on 29/09/18.
//  Copyright © 2018 Amadeu Cavalcante Filho. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {

    let signinLabel = UILabel()
    let usernameTextField = UITextField()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let confirmPasswordTextField = UITextField()
    let sendButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        setupLayout()
        setupConstraints()
    }
    
    func setupLayout() {
        self.view.addSubview(signinLabel)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(confirmPasswordTextField)
        self.view.addSubview(sendButton)
        
        signinLabel.text = "Signin"
        signinLabel.translatesAutoresizingMaskIntoConstraints=false
        signinLabel.font = UIFont(name: "Arial", size: 30 )
        signinLabel.textAlignment = .center
        usernameTextField.placeholder = "Username"
        usernameTextField.font = UIFont(name: "Arial", size: 24 )
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email"
        emailTextField.font = UIFont(name: "Arial", size: 24 )
        emailTextField.translatesAutoresizingMaskIntoConstraints=false
        passwordTextField.placeholder = "Password"
        passwordTextField.font = UIFont(name: "Arial", size: 24 )
        passwordTextField.translatesAutoresizingMaskIntoConstraints=false
        confirmPasswordTextField.placeholder = "Confirm Password"
        confirmPasswordTextField.font = UIFont(name: "Arial", size: 24 )
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints=false
        sendButton.setTitle("Register", for: .normal)
        sendButton.titleLabel?.font = UIFont(name: "Arial", size: 24 )
        sendButton.backgroundColor = .black
        sendButton.addTarget(self, action: #selector(registerUser), for: .touchUpInside)
        sendButton.translatesAutoresizingMaskIntoConstraints=false

    }
    
    func setupConstraints() {
        
        signinLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        usernameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        confirmPasswordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        var views : [String : UIView] = ["signinLabel": signinLabel]
        var formatStringHorizontal = "H:|-30-[signinLabel(==270)]-30-|"
        var formatStringVertical = "V:|-100-[signinLabel]"
        
        addConstraints(views: views, constraintsHorizontal: formatStringHorizontal, constraintsVertical: formatStringVertical)
        
        
        views = ["signinLabel": signinLabel, "usernameTextField": usernameTextField]
        formatStringHorizontal = "H:|-30-[usernameTextField(==270)]-30-|"
        formatStringVertical = "V:[signinLabel]-20-[usernameTextField]"
        
        addConstraints(views: views, constraintsHorizontal: formatStringHorizontal, constraintsVertical: formatStringVertical)
        
        views = ["usernameTextField": usernameTextField, "emailTextField": emailTextField]
        formatStringHorizontal = "H:|-30-[emailTextField(==270)]-30-|"
        formatStringVertical = "V:[usernameTextField]-20-[emailTextField]"
        
        addConstraints(views: views, constraintsHorizontal: formatStringHorizontal, constraintsVertical: formatStringVertical)
        
        views = ["emailTextField": emailTextField, "passwordTextField": passwordTextField]
        formatStringHorizontal = "H:|-30-[passwordTextField(==270)]-30-|"
        formatStringVertical = "V:[emailTextField]-20-[passwordTextField]"
        
        addConstraints(views: views, constraintsHorizontal: formatStringHorizontal, constraintsVertical: formatStringVertical)
        
        views = ["passwordTextField": passwordTextField, "confirmPasswordTextField": confirmPasswordTextField]
        formatStringHorizontal = "H:|-30-[confirmPasswordTextField(==270)]-30-|"
        formatStringVertical = "V:[passwordTextField]-20-[confirmPasswordTextField]"
        
        addConstraints(views: views, constraintsHorizontal: formatStringHorizontal, constraintsVertical: formatStringVertical)
        
        views = ["confirmPasswordTextField": confirmPasswordTextField, "sendButton": sendButton]
        formatStringHorizontal = "H:|-70-[sendButton]-70-|"
        formatStringVertical = "V:[confirmPasswordTextField]-60-[sendButton]"
        
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
    func registerUser(sender: UIButton!) {
        print("Register")
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
