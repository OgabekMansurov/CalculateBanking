//
//  MortgageViewController.swift
//  Calculator banking
//
//  Created by admin on 2023/6/7.
//

import UIKit

class MortgageViewController: UIViewController {
    
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
    
    private let Label1: UILabel = {
        let label = UILabel()
        label.text = "Mortgage Value"
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
    private let Label3: UILabel = {
        let label = UILabel()
        label.text = "Monthly Payment"
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
        label.text = "No. of Years (Time)"
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
    
    
    
    var mortgage: Mortgage = Mortgage(loanAmount: 0.0, interest: 0.0, payment: 0.0, numberOfYears: 0.0)
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mortgage"
        
        
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        
        view.addSubview(imageView)
        let blueEffect = UIBlurEffect(style: .light)
        view.addSubview(blurView)
        blurView.effect = blueEffect
    
    }
    
    
    @objc private func save() {
        
    }
    
    @objc private func onCalculate(_ sender: UIButton) {
        sender.pulsate()
        
        if userfield1.checkIfEmpty() == false && userfield2.checkIfEmpty() == false && userfield3.checkIfEmpty() == false && userfield4.checkIfEmpty() == true{
            
            
            mortgage.loanAmount = Double(userfield1.text!)!
            mortgage.interest = Double(userfield2.text!)!
            mortgage.payment = Double(userfield3.text!)!
            
            userfield4.text = String(mortgage.calculateNumberOfYears())
            
        } else if userfield1.checkIfEmpty() == false && userfield2.checkIfEmpty() == false && userfield4.checkIfEmpty() == false && userfield3.checkIfEmpty() == true{
            
            
            mortgage.loanAmount = Double(userfield1.text!)!
            mortgage.interest = Double(userfield2.text!)!
            mortgage.numberOfYears = Double(userfield4.text!)!
            
            userfield3.text = String(mortgage.calculateMonthlyPayment())
            
        } else if userfield1.checkIfEmpty() == true && userfield2.checkIfEmpty() == false && userfield4.checkIfEmpty() == false && userfield3.checkIfEmpty() == false{
            
            
            mortgage.numberOfYears = Double(userfield4.text!)!
            mortgage.interest = Double(userfield2.text!)!
            mortgage.payment = Double(userfield3.text!)!
            
            userfield1.text = String(mortgage.calculateLoanAmount())
            
        } else if userfield1.checkIfEmpty() == false && userfield2.checkIfEmpty() == true && userfield4.checkIfEmpty() == false && userfield3.checkIfEmpty() == false{
            
            
            mortgage.loanAmount = Double(userfield1.text!)!
            mortgage.numberOfYears = Double(userfield4.text!)!
            mortgage.payment = Double(userfield3.text!)!
            
            userfield2.text = String(mortgage.calculateAnnualInterestRate())
            
            
        } else {
            showAlert(title: "Error", msg: "Invalid Operation")
        }
        
    }
    
//    func clearAllField() {
//        for tf in self.textFields {
//            tf.clearField()
//        }
    
    @objc fileprivate func clear(viewToAnimate: UIView) {
        
        
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
   @objc private func onSave(_ sender: UIBarButtonItem) {
        
        ///Makes sure that none of the textfields are empty
        if userfield1.checkIfEmpty() == false && userfield2.checkIfEmpty() == false && userfield3.checkIfEmpty() == false && userfield4.checkIfEmpty() == false {
            
            ///Makes sure that the object is not holding empty values
            if(mortgage.loanAmount != 0 && mortgage.interest != 0 && mortgage.payment != 0 && mortgage.numberOfYears != 0) {
                
                let defaults = UserDefaults.standard
                let historyString = " 1. Mortgage Value - \(mortgage.loanAmount) \n 2. Interest Rate (%) - \(mortgage.interest)  \n 3. Monthly Payment - \(mortgage.payment) \n 4. Number of Years (Time) - \(mortgage.numberOfYears)"
                
                ///Resets the object to default values as soon as a save operation is done (to prevent re-saving values without making another calculation)
                (mortgage.loanAmount, mortgage.interest, mortgage.payment, mortgage.numberOfYears) = (0,0,0,0)
                
                ///Makes sure that the history list only holds last 5 calculations
                if(mortgage.historyStringArray.count > 4) {
                    mortgage.historyStringArray.removeFirst()
                    mortgage.historyStringArray.append(historyString)
                    defaults.set(mortgage.historyStringArray, forKey: "MortgageHistory")
                } else {
                    mortgage.historyStringArray.append(historyString)
                    defaults.set(mortgage.historyStringArray, forKey: "MortgageHistory")
                }
                
            } else {
                showAlert(title: "Error", msg: "Cannot save values without making a valid calculation")
            }
        } else {
            showAlert(title: "Error", msg: "Cannot save values with empty fields")
        }
        
        
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollView.addSubview(blurView)
        scrollView.addSubview(Label1)
        scrollView.addSubview(Label2)
        scrollView.addSubview(Label3)
        scrollView.addSubview(Label4)
        scrollView.addSubview(userfield1)
        scrollView.addSubview(userfield2)
        scrollView.addSubview(userfield3)
        scrollView.addSubview(userfield4)
        scrollView.addSubview(CalculeteButton)
        scrollView.addSubview(ClearButton)
        
        
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
            
            Label1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            Label1.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30),
            
            userfield1.topAnchor.constraint(equalTo: Label1.bottomAnchor, constant: 10),
            userfield1.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15),
            userfield1.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15),
            userfield1.bottomAnchor.constraint(equalTo: Label2.topAnchor, constant: -20),
            
            Label2.topAnchor.constraint(equalTo: userfield1.bottomAnchor, constant: 20),
            Label2.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30),
            
            userfield2.topAnchor.constraint(equalTo: Label2.bottomAnchor, constant: 10),
            userfield2.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15),
            userfield2.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15),
            userfield2.bottomAnchor.constraint(equalTo: Label3.topAnchor, constant: -20),
            
            Label3.topAnchor.constraint(equalTo: userfield2.bottomAnchor, constant: 20),
            Label3.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30),
            
            userfield3.topAnchor.constraint(equalTo: Label3.bottomAnchor, constant: 10),
            userfield3.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15),
            userfield3.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15),
            userfield3.bottomAnchor.constraint(equalTo: Label4.topAnchor, constant: -20),
            
            Label4.topAnchor.constraint(equalTo: userfield3.bottomAnchor, constant: 20),
            Label4.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30),
            
            userfield4.topAnchor.constraint(equalTo: Label4.bottomAnchor, constant: 10),
            userfield4.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15),
            userfield4.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15),
            userfield4.bottomAnchor.constraint(equalTo: blurView.bottomAnchor, constant: -20),
           
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
}
