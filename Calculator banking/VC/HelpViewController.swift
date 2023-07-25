//
//  HelpViewController.swift
//  Calculator banking
//
//  Created by admin on 2023/6/8.
//

import UIKit

class HelpViewController: UIViewController {
  
    
    
    
    
    
    private let TableView: UITableView = {
       let tableView = UITableView()
        tableView.register(HelpTableViewCell.self, forCellReuseIdentifier: HelpTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var datas: [HelpTitleUI] = [
    
        HelpTitleUI(HeaderLabel: "Types of financial calculations supported", titleLabel: "1. Mortgage\n2. Loans\n3. Savings\n4. Compound Savings", descLabel: "", image: ""),
        HelpTitleUI(HeaderLabel: "Mortgage", titleLabel: "1. Mortgage Value\n2. Interest Rate\n3. Monthly Payment\n4. Number of Years", descLabel: "Note: Any one of the above values can be calculated when three of the remaining values are present", image: "screen1"),
        HelpTitleUI(HeaderLabel: "Loans", titleLabel: "1. Mortgage Value\n2. Interest Rate\n3. Monthly Payment\n4. Number of Payments (12/year)", descLabel: "Note: Any one of the above values can be calculated when three of the remaining values are present", image: "screen2"),
        HelpTitleUI(HeaderLabel: "Saving", titleLabel: "1. Principal Amount\n2. Interest Rate (Doesn't work)\n3. Deposit\n4. Future Value\n5. Total Number of Deposits (1 = 1 month)", descLabel: "Note: Any one of the above values can be calculated when four of the remaining values are present", image: "screen3"),
        HelpTitleUI(HeaderLabel: "Compound Savings", titleLabel: "1. Present Value\n2. Future Value\n3. Interest Rate\n4. Number of Years", descLabel: "Note: Any one of the above values can be calculated when three of the remaining values are present", image: "screen4"),
        HelpTitleUI(HeaderLabel: "Button Functions", titleLabel: "1. Calculate Buton\nCalculates the unknown field\nSaves all the text field values of a successful calculation to be restored after an app crash / close\n2. Clear Button\nClears all the text field values from the selected screen\nPermanently removes all the stored / current text field values from storage  ", descLabel: "", image: ""),
    ]
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(TableView)
        TableView.delegate = self
        TableView.dataSource = self
        TableView.frame = view.bounds
        TableView.backgroundColor = .systemGreen
        
        
    }
    

    
}

extension HelpViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = datas[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: HelpTableViewCell.identifier, for: indexPath) as! HelpTableViewCell
        cell.reload(item: model)
        cell.selectionStyle = .none
        cell.backgroundColor = .systemGreen
        return cell
    }
    
    
}
