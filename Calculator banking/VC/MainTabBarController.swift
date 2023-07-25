//
//  MainTabBarController.swift
//  Calculator banking
//
//  Created by admin on 2023/6/7.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let blur = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = self.view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.tabBar.addSubview(blurView)
        self.tabBar.sendSubviewToBack(blurView)
        
        setTabBarAppearance()
        
        
        let Mortgage = UINavigationController(rootViewController: MortgageViewController())
        let Loans = UINavigationController(rootViewController: LoansViewController())
        let Saving = UINavigationController(rootViewController: SavingViewController())
        let CompuntSaving = UINavigationController(rootViewController: CompuntSavingViewController())
        let More = UINavigationController(rootViewController: HelpViewController())
        
        Mortgage.tabBarItem.image = UIImage(named: "mortgage")
        Loans.tabBarItem.image = UIImage(named: "loan")
        Saving.tabBarItem.image = UIImage(named: "savings")
        CompuntSaving.tabBarItem.image = UIImage(named: "compound-savings")
        More.tabBarItem.image = UIImage(named: "help")
        
        Mortgage.title = "Mortgage"
        Loans.title = "Loans"
        Saving.title = "Saving"
        CompuntSaving.title = "Compunt Saving"
        More.title = "Help"
        
        tabBar.tintColor = .white
        setViewControllers([ Mortgage, Loans, Saving, CompuntSaving, More ] , animated: false)
        
    }
    private func setTabBarAppearance() {
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white.withAlphaComponent(0.5)
    }

}
