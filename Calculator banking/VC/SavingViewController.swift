//
//  SavingViewController.swift
//  Calculator banking
//
//  Created by admin on 2023/6/7.
//

import UIKit

class SavingViewController:UIViewController {
    
    
    let switchOnandof = UISwitch()
    let label = UILabel()
    
    var savings: Savings = Savings(principalAmount: 0.0, interest: 0.0, payment: 0.0, compoundsPerYear: 12, paymentsPerYear: 12, futureValue: 0.0, totalNumberOfPayments: Int(0.0))
    
    let CalculeteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(onCalculate), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.green.cgColor
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(hexString: "#19A975").withAlphaComponent(0.8)
        button.layer.masksToBounds = true
        
        return button
    }()
    let ClearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.white, for: .normal)
                button.addTarget(self, action: #selector(clear), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.cornerRadius = 15
        button.backgroundColor = .red
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        button.layer.shadowOpacity = 10.0
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = true
        
        return button
    }()
    
    let button12mounth: UIButton = {
        let button = UIButton()
        button.setTitle("No of Compounds Per Year (12/year)", for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 10
        button.titleLabel?.textAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let button12year: UIButton = {
        let button = UIButton()
        button.setTitle("No of Deposit Per Year (12/year)", for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 10
        button.titleLabel?.textAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let userfield1: UITextField = {
        let userfield = UITextField()
        userfield.backgroundColor = UIColor.white
        userfield.borderStyle = UITextField.BorderStyle.roundedRect
        userfield.keyboardType = .emailAddress
        userfield.placeholder = "17500"
        userfield.keyboardType = .numberPad
        userfield.translatesAutoresizingMaskIntoConstraints = false
        return userfield
    }()
    let userfield2: UITextField = {
        let userfield = UITextField()
        userfield.backgroundColor = UIColor.white
        userfield.borderStyle = UITextField.BorderStyle.roundedRect
        userfield.keyboardType = .emailAddress
        userfield.placeholder = "4.125"
        userfield.keyboardType = .numberPad
        userfield.translatesAutoresizingMaskIntoConstraints = false
        return userfield
    }()
    let userfield3: UITextField = {
        let userfield = UITextField()
        userfield.backgroundColor = UIColor.white
        userfield.borderStyle = UITextField.BorderStyle.roundedRect
        userfield.keyboardType = .emailAddress
        userfield.placeholder = "848.14"
        userfield.keyboardType = .numberPad
        userfield.translatesAutoresizingMaskIntoConstraints = false
        return userfield
    }()
    let userfield4: UITextField = {
        let userfield = UITextField()
        userfield.backgroundColor = UIColor.white
        userfield.borderStyle = UITextField.BorderStyle.roundedRect
        userfield.keyboardType = .emailAddress
        userfield.placeholder = "30"
        userfield.keyboardType = .numberPad
        userfield.translatesAutoresizingMaskIntoConstraints = false
        return userfield
    }()
    
    let userfield5: UITextField = {
        let userfield = UITextField()
        userfield.backgroundColor = UIColor.white
        userfield.borderStyle = UITextField.BorderStyle.roundedRect
        userfield.keyboardType = .emailAddress
        userfield.placeholder = "6767.64"
        userfield.keyboardType = .numberPad
        userfield.translatesAutoresizingMaskIntoConstraints = false
        return userfield
    }()
    
    
    private let Label1: UILabel = {
        let label = UILabel()
        label.text = "Principal Amount"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let Label2: UILabel = {
        let label = UILabel()
        label.text = "Interest Rate (%)"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let LabelDeposit: UILabel = {
        let label = UILabel()
        label.text = "Depositmade at the:"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let Label3: UILabel = {
        let label = UILabel()
        label.text = "Deposit"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let Label4: UILabel = {
        let label = UILabel()
        label.text = "Future Value"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let Label5: UILabel = {
        let label = UILabel()
        label.text = "Total No. of Deposits"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "back")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    
    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.spacing = 10
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Saving"
        label.text = "Beginning"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .right
        
        self.navigationController?.isToolbarHidden = false
        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "History", style: .plain, target: self, action: #selector(save))
//        
//        self.navigationItem.rightBarButtonItem?.tintColor = .white
//        self.navigationItem.leftBarButtonItem?.tintColor = .white
        
        
        
        view.addSubview(imageView)
        let blueEffect = UIBlurEffect(style: .light)
        view.addSubview(blurView)
        blurView.effect = blueEffect
        
        
        switchOnandof.setOn(false, animated: true)
        switchOnandof.addTarget(self, action: #selector(updateSwitch), for:.valueChanged)
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollView.addSubview(blurView)
        scrollView.addSubview(Label1)
        scrollView.addSubview(Label2)
        scrollView.addSubview(Label3)
        scrollView.addSubview(Label4)
        scrollView.addSubview(Label5)
        scrollView.addSubview(userfield1)
        scrollView.addSubview(userfield2)
        scrollView.addSubview(userfield3)
        scrollView.addSubview(userfield4)
        scrollView.addSubview(userfield5)
        scrollView.addSubview(CalculeteButton)
        scrollView.addSubview(ClearButton)
        scrollView.addSubview(button12mounth)
        scrollView.addSubview(button12year)
        self.scrollView.addSubview(switchOnandof)
        self.scrollView.addSubview(label)
        scrollView.addSubview(LabelDeposit)
        
        switchOnandof.translatesAutoresizingMaskIntoConstraints  = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            blurView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            blurView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            blurView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            scrollViewContainer.leadingAnchor.constraint(equalTo: blurView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: blurView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: blurView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: blurView.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            Label1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            Label1.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30),
            
            userfield1.topAnchor.constraint(equalTo: Label1.bottomAnchor, constant: 10),
            userfield1.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15),
            userfield1.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15),
            userfield1.bottomAnchor.constraint(equalTo: Label2.topAnchor, constant: -10),
            
            Label2.topAnchor.constraint(equalTo: userfield1.bottomAnchor, constant: 10),
            Label2.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30),
            
            userfield2.topAnchor.constraint(equalTo: Label2.bottomAnchor, constant: 10),
            userfield2.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15),
            userfield2.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15),
            userfield2.bottomAnchor.constraint(equalTo: Label3.topAnchor, constant: -10),
            
            Label3.topAnchor.constraint(equalTo: userfield2.bottomAnchor, constant: 10),
            Label3.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30),
            
            userfield3.topAnchor.constraint(equalTo: Label3.bottomAnchor, constant: 10),
            userfield3.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15),
            userfield3.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15),
            userfield3.bottomAnchor.constraint(equalTo: button12mounth.topAnchor, constant: -10),
            
            button12mounth.topAnchor.constraint(equalTo: userfield3.bottomAnchor, constant: 10),
            button12mounth.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15),
            button12mounth.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15),
            button12mounth.heightAnchor.constraint(equalToConstant: 35),
            
            button12year.topAnchor.constraint(equalTo: button12mounth.bottomAnchor, constant: 10),
            button12year.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15),
            button12year.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15),
            button12year.heightAnchor.constraint(equalToConstant: 35),
            
            
            
            Label4.topAnchor.constraint(equalTo: button12year.bottomAnchor, constant: 10),
            Label4.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30),
            
            userfield4.topAnchor.constraint(equalTo: Label4.bottomAnchor, constant: 10),
            userfield4.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15),
            userfield4.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15),
            userfield4.bottomAnchor.constraint(equalTo: Label5.topAnchor, constant: -10),
            
            Label5.topAnchor.constraint(equalTo: userfield4.bottomAnchor, constant: 10),
            Label5.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30),
            
            userfield5.topAnchor.constraint(equalTo: Label5.bottomAnchor, constant: 10),
            userfield5.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15),
            userfield5.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15),
            userfield5.bottomAnchor.constraint(equalTo: switchOnandof.topAnchor, constant: -10),
            
            switchOnandof.topAnchor.constraint(equalTo: userfield5.bottomAnchor, constant: 10),
            switchOnandof.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15),
            switchOnandof.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: -10),
            
            label.topAnchor.constraint(equalTo: userfield5.bottomAnchor, constant: 10),
            label.rightAnchor.constraint(equalTo: switchOnandof.leftAnchor, constant: -15),
            label.bottomAnchor.constraint(equalTo: blurView.bottomAnchor, constant: -10),
            label.heightAnchor.constraint(equalToConstant: 30),
            label.widthAnchor.constraint(equalToConstant: 100),
            
            LabelDeposit.topAnchor.constraint(equalTo: userfield5.bottomAnchor, constant: 10),
            LabelDeposit.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15),
            
            ClearButton.topAnchor.constraint(equalTo: blurView.bottomAnchor, constant: 20),
            ClearButton.leftAnchor.constraint(equalTo: blurView.leftAnchor, constant: 20),
            ClearButton.widthAnchor.constraint(equalToConstant: 100),
            ClearButton.heightAnchor.constraint(equalToConstant: 65),
            
            CalculeteButton.topAnchor.constraint(equalTo: blurView.bottomAnchor, constant: 20),
            CalculeteButton.rightAnchor.constraint(equalTo: blurView.rightAnchor, constant: -20),
            CalculeteButton.leftAnchor.constraint(equalTo: ClearButton.rightAnchor, constant: 20),
            CalculeteButton.heightAnchor.constraint(equalToConstant: 65),
            
        ])
    }
    @objc private func save() {
        
    }
    
    @objc func updateSwitch () {
        label.text = switchOnandof .isOn ? "End" : "Beginning"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .right
    }
    
    @objc private func onCalculate(_ sender: UIButton) {
        sender.pulsate()
        //
        if(label.text) == "End" {
            
            if userfield1.checkIfEmpty() == true && userfield2.checkIfEmpty() == false && userfield3.checkIfEmpty() == false && userfield4.checkIfEmpty() == false && userfield5.checkIfEmpty() == false {
                
                savings.interest = Double(userfield2.text!)!
                savings.futureValue = Double(userfield3.text!)!
                savings.payment = Double(userfield4.text!)!
                savings.totalNumberOfPayments = Int(Double(userfield5.text!)!)
                
                userfield1.text = String(savings.calculateEndPrincipalAmount())
                
            } else if userfield1.checkIfEmpty() == false && userfield2.checkIfEmpty() == false && userfield3.checkIfEmpty() == false && userfield4.checkIfEmpty() == true && userfield5.checkIfEmpty() == false {
                
                savings.interest = Double(userfield2.text!)!
                savings.futureValue = Double(userfield3.text!)!
                savings.principalAmount = Double(userfield1.text!)!
                savings.totalNumberOfPayments = Int(Double(userfield5.text!)!)
                
                userfield4.text = String(savings.calculateEndPayment())
                
                
            } else if userfield1.checkIfEmpty() == false && userfield2.checkIfEmpty() == false && userfield3.checkIfEmpty() == true && userfield4.checkIfEmpty() == false && userfield5.checkIfEmpty() == false {
                
                savings.interest = Double(userfield2.text!)!
                savings.payment = Double(userfield4.text!)!
                savings.principalAmount = Double(userfield1.text!)!
                savings.totalNumberOfPayments = Int(Double(userfield5.text!)!)
                
                userfield3.text = String(savings.calculateEndFutureValue())
                
                
                
            } else if userfield1.checkIfEmpty() == false && userfield2.checkIfEmpty() == false && userfield3.checkIfEmpty() == false && userfield4.checkIfEmpty() == false && userfield5.checkIfEmpty() == true {
                
                savings.interest = Double(userfield2.text!)!
                savings.payment = Double(userfield4.text!)!
                savings.principalAmount = Double(userfield1.text!)!
                savings.futureValue = Double(userfield3.text!)!
                
                userfield5.text = String(savings.calculateEndNumberOfPayments())
                
                
            } else if userfield1.checkIfEmpty() == false && userfield2.checkIfEmpty() == true && userfield3.checkIfEmpty() == false && userfield4.checkIfEmpty() == false && userfield5.checkIfEmpty() == false {
                
                savings.totalNumberOfPayments = Int(Double(userfield5.text!)!)
                savings.payment = Double(userfield4.text!)!
                savings.principalAmount = Double(userfield1.text!)!
                savings.futureValue = Double(userfield3.text!)!
                
                userfield2.text = String(savings.calculateInterest())
                
                
            } else {
                showAlert(title: "Error", msg: "Invalid Operation")
                
            }
            
        } else {
            
            if userfield1.checkIfEmpty() == true && userfield2.checkIfEmpty() == false && userfield3.checkIfEmpty() == false && userfield4.checkIfEmpty() == false && userfield5.checkIfEmpty() == false {
                
                savings.interest = Double(userfield2.text!)!
                savings.futureValue = Double(userfield3.text!)!
                savings.payment = Double(userfield4.text!)!
                savings.totalNumberOfPayments = Int(Double(userfield5.text!)!)
                
                userfield1.text = String(savings.calculateBeginningPrincipalAmount())
                
            } else if userfield1.checkIfEmpty() == false && userfield2.checkIfEmpty() == false && userfield3.checkIfEmpty() == false && userfield4.checkIfEmpty() == true && userfield5.checkIfEmpty() == false {
                
                savings.interest = Double(userfield2.text!)!
                savings.futureValue = Double(userfield3.text!)!
                savings.principalAmount = Double(userfield1.text!)!
                savings.totalNumberOfPayments = Int(Double(userfield5.text!)!)
                
                userfield4.text = String(savings.calculateBeginningPayment())
                
                
                
            } else if userfield1.checkIfEmpty() == false && userfield2.checkIfEmpty() == false && userfield3.checkIfEmpty() == true && userfield4.checkIfEmpty() == false && userfield5.checkIfEmpty() == false {
                
                savings.interest = Double(userfield2.text!)!
                savings.payment = Double(userfield4.text!)!
                savings.principalAmount = Double(userfield1.text!)!
                savings.totalNumberOfPayments = Int(Double(userfield5.text!)!)
                
                userfield3.text = String(savings.calculateBeginningFutureValue())
                
                
            } else if userfield1.checkIfEmpty() == false && userfield2.checkIfEmpty() == false && userfield3.checkIfEmpty() == false && userfield4.checkIfEmpty() == false && userfield5.checkIfEmpty() == true {
                
                savings.interest = Double(userfield2.text!)!
                savings.payment = Double(userfield4.text!)!
                savings.principalAmount = Double(userfield1.text!)!
                savings.futureValue = Double(userfield3.text!)!
                
                userfield5.text = String(savings.calculateBeginningNumberOfPayments())
                
                
            } else if userfield1.checkIfEmpty() == false && userfield2.checkIfEmpty() == true && userfield3.checkIfEmpty() == false && userfield4.checkIfEmpty() == false && userfield5.checkIfEmpty() == false {
                
                savings.totalNumberOfPayments = Int(Double(userfield5.text!)!)
                savings.payment = Double(userfield4.text!)!
                savings.principalAmount = Double(userfield1.text!)!
                savings.futureValue = Double(userfield3.text!)!
                
                userfield2.text = String(savings.calculateInterest())
                
                
            } else {
                showAlert(title: "Error", msg: "Invalid Operation")
                
            }
            
        }
        
        //    @objc fileprivate func calculate(viewToAnimate: UIView) {
        //            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
        //                viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        //            }) {
        //                (_) in
        //                UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
        //                    viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
        //
        //                }, completion: nil)
        //            }
            }
        @objc private func clear(viewToAnimate: UIView) {
            userfield1.text = ""
            userfield2.text = ""
            userfield3.text = ""
            userfield4.text = ""

            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
            }) {
                (_) in
                UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                    viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)

                }, completion: nil)
            }
        }
    }

