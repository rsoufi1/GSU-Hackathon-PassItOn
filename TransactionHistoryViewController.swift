//
//  TransactionHistoryViewController.swift
//  HackGSU State Farm Challenge
//
//  Created by Raneem Sofi on 11/3/19.
//  Copyright © 2019 Raneem Sofi. All rights reserved.
//

import UIKit

class TransactionHistoryViewController: UIViewController {

    @IBOutlet var TransactionTableView: UITableView!
    @IBOutlet var TransLabel: UILabel!
    @IBOutlet var ReturnButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
         if let index = self.TransactionTableView.indexPathForSelectedRow{
             self.TransactionTableView.deselectRow(at: index, animated: true)
         }
     }
    
    @IBAction func ReturnButtonPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailTransaction"{
            let vc = segue.destination as! DetailTransactionViewController
            let cell = sender as! HistoryCells
            let index = cell.index
            vc.selectedIndex = index
        }
    }

}

extension TransactionHistoryViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let defaults = UserDefaults.standard
        let numberEntries = defaults.integer(forKey: "numberEntries")
        return numberEntries
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell") as! HistoryCells
        
        let dateKey = "date" + String(indexPath.item + 1)
        let totalKey = "total" + String(indexPath.item + 1)
        
        let defaults = UserDefaults.standard
        let date = defaults.string(forKey: dateKey)
        let total = defaults.float(forKey: totalKey)
        
        let numString: String = String(format: "%.2f", total ?? "0")
        
        cell.L1.text = "Transaction on " + (date ?? "Error")
        cell.L2.text = numString
        
        cell.index = indexPath.item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

//HistoryCell
class HistoryCells: UITableViewCell{
    
    @IBOutlet var L1: UILabel!
    @IBOutlet var L2: UILabel!
    var index = 0
    
}
