//
//  DetailTransactionViewController.swift
//  HackGSU State Farm Challenge
//
//  Created by Raneem Sofi on 11/3/19.
//  Copyright © 2019 Raneem Sofi. All rights reserved.
//

import UIKit

class DetailTransactionViewController: UIViewController {

    @IBOutlet var Label: UILabel!
    @IBOutlet var TransactionTableview: UITableView!
    @IBOutlet var Button: UIButton!
    
    var selectedIndex = 0
    override func viewDidLoad() {
        let defaults = UserDefaults.standard
        let dateKey = "date" + String(selectedIndex + 1)
        let date = defaults.string(forKey: dateKey)
        Label.text = "Transaction History on " + (date ?? "00")
        
        self.Button.layer.cornerRadius = 10
        self.Button.clipsToBounds = true
        
        super.viewDidLoad()
    }
    
    @IBAction func ReturnButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension DetailTransactionViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let defaults = UserDefaults.standard
        let foodKey = "food" + String(selectedIndex + 1)
        
        let items = defaults.array(forKey: foodKey)
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTransaction") as! DetailTransactionCell
        let defaults = UserDefaults.standard
        let foodKey = "food" + String(selectedIndex + 1)
        
        let items = defaults.array(forKey: foodKey)
        cell.Label.text = items?[indexPath.item] as! String
        return cell
    }
    
    
}

class DetailTransactionCell: UITableViewCell{
    @IBOutlet var Label: UILabel!
    
}
